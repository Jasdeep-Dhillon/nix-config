{ inputs, self, ... }:
{
  flake.nixosModules.dms = {
    imports = [
      inputs.home-manager.nixosModules.default
      inputs.dms.nixosModules.dank-material-shell
      inputs.dms-plugin-registry.modules.default
    ];
    home-manager.users.arc = {
      imports = [ self.homeModules.dms ];
    };
    programs.dank-material-shell = {
      enable = true;
      enableSystemMonitoring = true;
      enableVPN = true;
      enableClipboardPaste = true;
      plugins = {
        commandRunner.enable = true;
        emojiLauncher.enable = true;
        dankActions.enable = true;
        usbManager.enable = true;
      };
    };
  };

  flake.homeModules.dms = {
    imports = [
      inputs.dms.homeModules.dank-material-shell
    ];
    programs.dank-material-shell = {
      enable = true;
      settings = {
        currentThemeName = "custom";
        currentThemeCategory = "registry";
        customThemeFile = "/home/arc/.config/DankMaterialShell/themes/catppuccin/theme.json";
        registryThemeVariants = {
          catppuccin = {
            dark = {
              flavor = "mocha";
              accent = "lavender";
            };
          };
        };
        matugenScheme = "scheme-tonal-spot";
        runUserMatugenTemplates = true;
        matugenTargetMonitor = "";
        popupTransparency = 1;
        dockTransparency = 1;
        widgetBackgroundColor = "sch";
        widgetColorMode = "default";
        controlCenterTileColorMode = "primary";
        buttonColorMode = "primary";
        cornerRadius = 12;

        use24HourClock = true;
        showSeconds = false;
        padHours12Hour = false;
        useFahrenheit = false;
        windSpeedUnit = "kmh";
        nightModeEnabled = false;
        animationSpeed = 1;
        customAnimationDuration = 500;
        syncComponentAnimationSpeeds = true;
        popoutAnimationSpeed = 1;
        popoutCustomAnimationDuration = 150;
        modalAnimationSpeed = 1;
        modalCustomAnimationDuration = 150;
        enableRippleEffects = true;
        blurEnabled = false;
        blurForegroundLayers = true;
        blurLayerOutlineOpacity = 0.12;
        blurBorderColor = "outline";
        blurBorderCustomColor = "#ffffff";
        blurBorderOpacity = 0.35;
        wallpaperFillMode = "Fill";
        blurredWallpaperLayer = false;
        blurWallpaperOnOverview = true;
        showLauncherButton = true;
        showWorkspaceSwitcher = true;
        showFocusedWindow = true;
        showWeather = true;
        showMusic = true;
        showClipboard = true;
        showCpuUsage = true;
        showMemUsage = true;
        showCpuTemp = true;
        showGpuTemp = true;
        selectedGpuIndex = 0;
        enabledGpuPciIds = [ ];
        showSystemTray = true;
        systemTrayIconTintMode = "none";
        systemTrayIconTintSaturation = 50;
        systemTrayIconTintStrength = 135;
        showClock = true;
        showNotificationButton = true;
        showBattery = true;
        showControlCenterButton = true;
        showCapsLockIndicator = true;
        controlCenterShowNetworkIcon = true;
        controlCenterShowBluetoothIcon = true;
        controlCenterShowAudioIcon = true;
        controlCenterShowAudioPercent = false;
        controlCenterShowVpnIcon = true;
        controlCenterShowBrightnessIcon = false;
        controlCenterShowBrightnessPercent = false;
        controlCenterShowMicIcon = false;
        controlCenterShowMicPercent = true;
        controlCenterShowBatteryIcon = false;
        controlCenterShowPrinterIcon = false;
        controlCenterShowScreenSharingIcon = true;
        showPrivacyButton = true;
        privacyShowMicIcon = false;
        privacyShowCameraIcon = false;
        privacyShowScreenShareIcon = false;
        controlCenterWidgets = [
          {
            id = "volumeSlider";
            enabled = true;
            width = 50;
          }
          {
            id = "brightnessSlider";
            enabled = true;
            width = 50;
          }
          {
            id = "wifi";
            enabled = true;
            width = 50;
          }
          {
            id = "bluetooth";
            enabled = true;
            width = 50;
          }
          {
            id = "audioOutput";
            enabled = true;
            width = 50;
          }
          {
            id = "audioInput";
            enabled = true;
            width = 50;
          }
          {
            id = "darkMode";
            enabled = true;
            width = 50;
          }
          {
            id = "idleInhibitor";
            enabled = true;
            width = 50;
          }
          {
            id = "battery";
            enabled = true;
            width = 50;
          }
          {
            id = "doNotDisturb";
            enabled = true;
            width = 50;
          }
          {
            id = "builtin_vpn";
            enabled = true;
            width = 50;
          }
          {
            id = "colorPicker";
            enabled = true;
            width = 50;
          }
        ];
        showWorkspaceIndex = true;
        showWorkspaceName = false;
        showWorkspacePadding = false;
        workspaceScrolling = false;
        showWorkspaceApps = true;
        workspaceDragReorder = true;
        maxWorkspaceIcons = 20;
        workspaceAppIconSizeOffset = 0;
        groupWorkspaceApps = false;
        workspaceFollowFocus = false;
        showOccupiedWorkspacesOnly = false;
        reverseScrolling = false;
        dwlShowAllTags = false;
        workspaceColorMode = "default";
        workspaceOccupiedColorMode = "none";
        workspaceUnfocusedColorMode = "s";
        workspaceUrgentColorMode = "default";
        workspaceFocusedBorderEnabled = false;
        workspaceFocusedBorderColor = "primary";
        workspaceFocusedBorderThickness = 2;
        workspaceNameIcons = {
          game = {
            type = "icon";
            value = "sports_esports";
          };
          chat = {
            type = "icon";
            value = "headphones";
          };
        };
        waveProgressEnabled = true;
        scrollTitleEnabled = true;
        audioVisualizerEnabled = true;
        audioScrollMode = "volume";
        audioWheelScrollAmount = 5;
        clockCompactMode = false;
        focusedWindowCompactMode = false;
        runningAppsCompactMode = true;
        barMaxVisibleApps = 0;
        barMaxVisibleRunningApps = 0;
        barShowOverflowBadge = true;
        appsDockHideIndicators = false;
        appsDockColorizeActive = false;
        appsDockActiveColorMode = "primary";
        appsDockEnlargeOnHover = false;
        appsDockEnlargePercentage = 125;
        appsDockIconSizePercentage = 100;
        keyboardLayoutNameCompactMode = false;
        runningAppsCurrentWorkspace = true;
        runningAppsGroupByApp = false;
        runningAppsCurrentMonitor = false;
        appIdSubstitutions = [ ];
        centeringMode = "index";
        clockDateFormat = "dddd, MMMM d";
        lockDateFormat = "";
        greeterRememberLastSession = true;
        greeterRememberLastUser = true;
        greeterEnableFprint = false;
        greeterEnableU2f = false;
        greeterWallpaperPath = "";
        greeterUse24HourClock = true;
        greeterShowSeconds = false;
        greeterPadHours12Hour = false;
        greeterLockDateFormat = "";
        greeterFontFamily = "";
        greeterWallpaperFillMode = "";
        mediaSize = 1;
        appLauncherViewMode = "list";
        spotlightModalViewMode = "list";
        browserPickerViewMode = "grid";
        browserUsageHistory = { };
        appPickerViewMode = "grid";
        filePickerUsageHistory = { };
        sortAppsAlphabetically = true;
        appLauncherGridColumns = 4;
        spotlightCloseNiriOverview = true;
        spotlightSectionViewModes = { };
        appDrawerSectionViewModes = { };
        niriOverviewOverlayEnabled = true;
        dankLauncherV2Size = "compact";
        dankLauncherV2BorderEnabled = false;
        dankLauncherV2BorderThickness = 2;
        dankLauncherV2BorderColor = "primary";
        dankLauncherV2ShowFooter = true;
        dankLauncherV2UnloadOnClose = true;
        useAutoLocation = true;
        weatherEnabled = true;
        networkPreference = "wifi";
        iconTheme = "System Default";
        cursorSettings = {
          theme = "System Default";
          size = 24;
          niri = {
            hideWhenTyping = false;
            hideAfterInactiveMs = 0;
          };
          hyprland = {
            hideOnKeyPress = false;
            hideOnTouch = false;
            inactiveTimeout = 0;
          };
          dwl = {
            cursorHideTimeout = 0;
          };
        };
        launcherLogoMode = "compositor";
        launcherLogoCustomPath = "";
        launcherLogoColorOverride = "primary";
        launcherLogoColorInvertOnMode = false;
        launcherLogoBrightness = 0.5;
        launcherLogoContrast = 1;
        launcherLogoSizeOffset = 7;
        fontFamily = "Inter";
        monoFontFamily = "Maple Mono NL NF";
        fontWeight = 400;
        fontScale = 1;
        notepadUseMonospace = true;
        notepadFontFamily = "";
        notepadFontSize = 14;
        notepadShowLineNumbers = false;
        notepadTransparencyOverride = "unknown character to parse: -";
        ",
        " = null;
        adLastCustomTransparency = 0.7;
        soundsEnabled = true;
        useSystemSoundTheme = false;
        soundNewNotification = true;
        soundVolumeChanged = true;
        soundPluggedIn = true;
        acMonitorTimeout = 300;
        acLockTimeout = 1800;
        acSuspendTimeout = 0;
        acSuspendBehavior = 0;
        acProfileName = "";
        batteryMonitorTimeout = 0;
        batteryLockTimeout = 0;
        batterySuspendTimeout = 0;
        batterySuspendBehavior = 0;
        batteryProfileName = "";
        batteryChargeLimit = 100;
        lockBeforeSuspend = false;
        loginctlLockIntegration = true;
        fadeToLockEnabled = true;
        fadeToLockGracePeriod = 5;
        fadeToDpmsEnabled = true;
        fadeToDpmsGracePeriod = 5;
        launchPrefix = "runapp";
        brightnessDevicePins = { };
        wifiNetworkPins = { };
        bluetoothDevicePins = { };
        audioInputDevicePins = { };
        audioOutputDevicePins = { };
        gtkThemingEnabled = false;
        qtThemingEnabled = false;
        syncModeWithPortal = true;
        terminalsAlwaysDark = false;
        runDmsMatugenTemplates = true;
        matugenTemplateGtk = true;
        matugenTemplateNiri = true;
        matugenTemplateHyprland = true;
        matugenTemplateMangowc = true;
        matugenTemplateQt5ct = true;
        matugenTemplateQt6ct = true;
        matugenTemplateFirefox = true;
        matugenTemplatePywalfox = true;
        matugenTemplateZenBrowser = true;
        matugenTemplateVesktop = true;
        matugenTemplateEquibop = true;
        matugenTemplateGhostty = true;
        matugenTemplateKitty = true;
        matugenTemplateFoot = true;
        matugenTemplateAlacritty = true;
        matugenTemplateNeovim = false;
        matugenTemplateWezterm = true;
        matugenTemplateDgop = true;
        matugenTemplateKcolorscheme = true;
        matugenTemplateVscode = true;
        matugenTemplateEmacs = true;
        matugenTemplateZed = true;
        showDock = false;
        dockAutoHide = false;
        dockSmartAutoHide = false;
        dockGroupByApp = false;
        dockOpenOnOverview = false;
        dockPosition = 1;
        dockSpacing = 4;
        dockBottomGap = 0;
        dockMargin = 0;
        dockIconSize = 40;
        dockIndicatorStyle = "circle";
        dockBorderEnabled = false;
        dockBorderColor = "surfaceText";
        dockBorderOpacity = 1;
        dockBorderThickness = 1;
        dockIsolateDisplays = false;
        dockLauncherEnabled = false;
        dockLauncherLogoMode = "apps";
        dockLauncherLogoCustomPath = "";
        dockLauncherLogoColorOverride = "";
        dockLauncherLogoSizeOffset = 0;
        dockLauncherLogoBrightness = 0.5;
        dockLauncherLogoContrast = 1;
        dockMaxVisibleApps = 0;
        dockMaxVisibleRunningApps = 0;
        dockShowOverflowBadge = true;
        notificationOverlayEnabled = false;
        notificationPopupShadowEnabled = true;
        notificationPopupPrivacyMode = false;
        modalDarkenBackground = true;
        lockScreenShowPowerActions = true;
        lockScreenShowSystemIcons = true;
        lockScreenShowTime = true;
        lockScreenShowDate = true;
        lockScreenShowProfileImage = true;
        lockScreenShowPasswordField = true;
        lockScreenShowMediaPlayer = true;
        lockScreenPowerOffMonitorsOnLock = false;
        lockAtStartup = false;
        enableFprint = false;
        maxFprintTries = 15;
        enableU2f = false;
        u2fMode = "or";
        lockScreenActiveMonitor = "all";
        lockScreenInactiveColor = "#000000";
        lockScreenNotificationMode = 0;
        hideBrightnessSlider = false;
        notificationTimeoutLow = 5000;
        notificationTimeoutNormal = 5000;
        notificationTimeoutCritical = 0;
        notificationCompactMode = false;
        notificationPopupPosition = 0;
        notificationAnimationSpeed = 1;
        notificationCustomAnimationDuration = 400;
        notificationHistoryEnabled = true;
        notificationHistoryMaxCount = 50;
        notificationHistoryMaxAgeDays = 7;
        notificationHistorySaveLow = true;
        notificationHistorySaveNormal = true;
        notificationHistorySaveCritical = true;
        notificationRules = [ ];
        osdAlwaysShowValue = true;
        osdPosition = 5;
        osdVolumeEnabled = true;
        osdMediaVolumeEnabled = true;
        osdMediaPlaybackEnabled = false;
        osdBrightnessEnabled = true;
        osdIdleInhibitorEnabled = true;
        osdMicMuteEnabled = true;
        osdCapsLockEnabled = true;
        osdPowerProfileEnabled = true;
        osdAudioOutputEnabled = true;
        powerActionConfirm = true;
        powerActionHoldDuration = 0.5;
        powerMenuActions = [
          "reboot"
          "logout"
          "poweroff"
          "lock"
          "suspend"
          "restart"
        ];
        powerMenuDefaultAction = "logout";
        powerMenuGridLayout = true;
        customPowerActionLock = "";
        customPowerActionLogout = "";
        customPowerActionSuspend = "";
        customPowerActionHibernate = "";
        customPowerActionReboot = "";
        customPowerActionPowerOff = "";
        updaterHideWidget = false;
        updaterUseCustomCommand = false;
        updaterCustomCommand = "";
        updaterTerminalAdditionalParams = "";
        displayNameMode = "model";
        screenPreferences = {
          wallpaper = [
            "all"
          ];
        };
        showOnLastDisplay = { };
        niriOutputSettings = { };
        hyprlandOutputSettings = { };
        displayProfiles = { };
        activeDisplayProfile = { };
        displayProfileAutoSelect = false;
        displayShowDisconnected = false;
        displaySnapToEdge = true;
        barConfigs = [
          {
            id = "default";
            name = "Main Bar";
            enabled = true;
            position = 0;
            screenPreferences = [
              "all"
            ];
            showOnLastDisplay = true;
            leftWidgets = [
              {
                id = "launcherButton";
                enabled = true;
              }
              {
                id = "music";
                enabled = true;
                mediaSize = 1;
              }
              {
                id = "clock";
                enabled = true;
              }
              {
                id = "weather";
                enabled = true;
              }
            ];
            centerWidgets = [
              {
                id = "workspaceSwitcher";
                enabled = true;
              }
            ];
            rightWidgets = [
              {
                id = "systemTray";
                enabled = true;
              }
              "clipboard"
              {
                id = "notificationButton";
                enabled = true;
              }
              {
                id = "battery";
                enabled = true;
              }
              {
                id = "controlCenterButton";
                enabled = true;
                showAudioPercent = false;
                showBrightnessIcon = false;
                showBrightnessPercent = false;
                showMicIcon = false;
                showBatteryIcon = false;
              }
            ];
            spacing = 4;
            innerPadding = 0;
            bottomGap = 0;
            transparency = 0.8;
            widgetTransparency = 1;
            squareCorners = false;
            noBackground = false;
            maximizeWidgetIcons = false;
            maximizeWidgetText = false;
            removeWidgetPadding = false;
            widgetPadding = 12;
            gothCornersEnabled = false;
            gothCornerRadiusOverride = true;
            gothCornerRadiusValue = 8;
            borderEnabled = false;
            borderColor = "surfaceText";
            borderOpacity = 1;
            borderThickness = 1;
            widgetOutlineEnabled = false;
            widgetOutlineColor = "primary";
            widgetOutlineOpacity = 1;
            widgetOutlineThickness = 1;
            fontScale = 1.25;
            iconScale = 1;
            autoHide = false;
            autoHideDelay = 250;
            showOnWindowsOpen = false;
            openOnOverview = false;
            visible = true;
            popupGapsAuto = true;
            popupGapsManual = 4;
            maximizeDetection = true;
            scrollEnabled = true;
            scrollXBehavior = "column";
            scrollYBehavior = "workspace";
            shadowIntensity = 0;
            shadowOpacity = 60;
            shadowColorMode = "text";
            shadowCustomColor = "#000000";
            clickThrough = true;
          }
        ];
        desktopClockEnabled = false;
        desktopClockStyle = "analog";
        desktopClockTransparency = 0.8;
        desktopClockColorMode = "primary";
        desktopClockWidth = 280;
        desktopClockHeight = 180;
        desktopClockDisplayPreferences = [
          "all"
        ];
        systemMonitorEnabled = false;
        systemMonitorShowHeader = true;
        systemMonitorTransparency = 0.8;
        systemMonitorColorMode = "primary";

        systemMonitorShowCpu = true;
        systemMonitorShowCpuGraph = true;
        systemMonitorShowCpuTemp = true;
        systemMonitorShowGpuTemp = false;
        systemMonitorGpuPciId = "";
        systemMonitorShowMemory = true;
        systemMonitorShowMemoryGraph = true;
        systemMonitorShowNetwork = true;
        systemMonitorShowNetworkGraph = true;
        systemMonitorShowDisk = true;
        systemMonitorShowTopProcesses = false;
        systemMonitorTopProcessCount = 3;
        systemMonitorTopProcessSortBy = "cpu";
        systemMonitorGraphInterval = 60;
        systemMonitorLayoutMode = "auto";
        systemMonitorWidth = 320;
        systemMonitorHeight = 480;
        systemMonitorDisplayPreferences = [
          "all"
        ];
        systemMonitorVariants = [ ];
        desktopWidgetPositions = { };
        desktopWidgetGridSettings = { };
        desktopWidgetInstances = [ ];
        desktopWidgetGroups = [ ];
        builtInPluginSettings = {
          dms_settings_search = {
            trigger = "?";
          };
        };
        clipboardEnterToPaste = true;
        launcherPluginVisibility = { };
        launcherPluginOrder = [ ];
        configVersion = 5;
      };
    };
  };
}
