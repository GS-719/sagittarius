// 1. Native Custom Wallpaper
var allDesktops = desktops();
for (var i = 0; i < allDesktops.length; i++) {
    var d = allDesktops[i];
    d.wallpaperPlugin = "org.kde.image";
    d.currentConfigGroup = ["Wallpaper", "org.kde.image", "General"];
    d.writeConfig("Image", "file:///usr/share/wallpapers/Sagittarius/contents/images/wallpaper.jpg");
}

// 2. Top Stats Strip
var topPanel = newPanel();
topPanel.location = "top";
topPanel.height = 24;
topPanel.hiding = "autohide";
topPanel.addWidget("org.kde.plasma.systemmonitor.cpu");
topPanel.addWidget("org.kde.plasma.systemmonitor.memory");
topPanel.addWidget("org.kde.plasma.systemmonitor.net");
topPanel.addWidget("org.kde.plasma.systemmonitor.diskactivity");

// 3. Bottom Command Panel
var bottomPanel = newPanel();
bottomPanel.location = "bottom";
bottomPanel.height = 30;
bottomPanel.hiding = "autohide";
bottomPanel.addWidget("org.kde.plasma.kickoff");
bottomPanel.addWidget("org.kde.plasma.icontasks");
bottomPanel.addWidget("org.kde.plasma.marginsseparator");
bottomPanel.addWidget("org.kde.plasma.systemtray");

var clock = bottomPanel.addWidget("org.kde.plasma.digitalclock");
clock.currentConfigGroup = ["Appearance"];
clock.writeConfig("showDate", "false");
