# Begin /etc/profile.d/qt6.sh

QT6DIR=/usr
export QT6DIR

# End /etc/profile.d/qt6.sh

# Begin kf5 extension for /etc/profile.d/qt6.sh

pathappend /usr/lib/plugins        QT_PLUGIN_PATH
pathappend "$QT6DIR"/lib/plugins     QT_PLUGIN_PATH

pathappend /usr/lib/qt6/qml        QML2_IMPORT_PATH
pathappend "$QT6DIR"/lib/qml         QML2_IMPORT_PATH

# End extension for /etc/profile.d/qt6.sh
