add_rules("mode.debug", "mode.release")
set_configdir("qt","~/Qt6.2.4")
target("demo")
    add_rules("qt.quickapp")
    add_headerfiles("src/*.h")
    add_files("src/*.cpp")
    add_files("src/qml.qrc")


