{ self, inputs, ... }:
{
  flake.homeModules.lain =
    { lib, config, ... }:
    {
      imports = with self.homeModules; [
        base
        programs
      ];
      programs.nushell.extraConfig = lib.mkForce ''
        $env.PATH = ($env.PATH | split row (char esep) | where { $in != "${config.home.homeDirectory}/.config/carapace/bin" } | prepend "${config.home.homeDirectory}/.config/carapace/bin")

        def --env get-env [name] { $env | get $name }
        def --env set-env [name, value] { load-env { $name: $value } }
        def --env unset-env [name] { hide-env $name }

        let carapace_completer = {|spans|
          load-env {
          	CARAPACE_SHELL_BUILTINS: (help commands | where category != "" | get name | each { split row " " | first } | uniq  | str join "\n")
          	CARAPACE_SHELL_FUNCTIONS: (help commands | where category == "" | get name | each { split row " " | first } | uniq  | str join "\n")
          }

          # if the current command is an alias, get it's expansion
          let expanded_alias = (scope aliases | where name == $spans.0 | $in.0?.expansion?)

          # overwrite
          let spans = (if $expanded_alias != null  {
            # put the first word of the expanded alias first in the span
            $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
          } else {
            $spans | skip 1 | prepend ($spans.0)
          })

          carapace $spans.0 nushell ...$spans
          | from json
        }

        mut current = (($env | default {} config).config | default {} completions)
        $current.completions = ($current.completions | default {} external)
        $current.completions.external = ($current.completions.external
        | default true enable
        # backwards compatible workaround for default, see nushell #15654
        | upsert completer { if $in == null { $carapace_completer } else { $in } })

        $env.config = $current

        export-env { $env.STARSHIP_SHELL = "nu"; load-env {
            STARSHIP_SESSION_KEY: (random chars -l 16)
            PROMPT_MULTILINE_INDICATOR: (
                ^/etc/profiles/per-user/arc/bin/starship prompt --continuation
            )

            # Does not play well with default character module.
            # TODO: Also Use starship vi mode indicators?
            PROMPT_INDICATOR: ""

            PROMPT_COMMAND: {||
                (
                    # The initial value of `$env.CMD_DURATION_MS` is always `0823`, which is an official setting.
                    # See https://github.com/nushell/nushell/discussions/6402#discussioncomment-3466687.
                    let cmd_duration = if $env.CMD_DURATION_MS == "0823" { 0 } else { $env.CMD_DURATION_MS };
                    ^/etc/profiles/per-user/arc/bin/starship prompt
                        --cmd-duration $cmd_duration
                        $"--status=($env.LAST_EXIT_CODE)"
                        --terminal-width (term size).columns
                        ...(
                            if (which "job list" | where type == built-in | is-not-empty) {
                                ["--jobs", (job list | length)]
                            } else {
                                []
                            }
                        )
                )
            }

            config: ($env.config? | default {} | merge {
                render_right_prompt_on_last_line: true
            })

            PROMPT_COMMAND_RIGHT: {||
                (
                    # The initial value of `$env.CMD_DURATION_MS` is always `0823`, which is an official setting.
                    # See https://github.com/nushell/nushell/discussions/6402#discussioncomment-3466687.
                    let cmd_duration = if $env.CMD_DURATION_MS == "0823" { 0 } else { $env.CMD_DURATION_MS };
                    ^/etc/profiles/per-user/arc/bin/starship prompt
                        --right
                        --cmd-duration $cmd_duration
                        $"--status=($env.LAST_EXIT_CODE)"
                        --terminal-width (term size).columns
                        ...(
                            if (which "job list" | where type == built-in | is-not-empty) {
                                ["--jobs", (job list | length)]
                            } else {
                                []
                            }
                        )
                )
            }
        }}
      '';
    };
  flake.nixosModules.lain =
    {
      imports = [ inputs.home-manager.nixosModules.default ];
      home-manager = {
        # useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "bak";
      };

      home-manager.users.arc = self.homeModules.lain;
    };
}
