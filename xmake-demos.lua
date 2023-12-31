add_rules("mode.debug", "mode.release")
set_configdir("qt","~/Qt/6.2.4/gcc_64")
toolchain("my_toolchain")
    set_toolset("cc", "clang")
    set_toolset("cxx", "clang", "clang++")
toolchain_end()
set_toolchains("my_toolchain")
add_includedirs("~/Qt/6.2.4/gcc_64/include")

-- add_frameworks("QtCore")
-- add_frameworks("QtGui")
-- add_frameworks("QtQml")
-- add_frameworks("QtQuick")
add_frameworks("QtDataVisualization")


-- demos
target("calqlatr")
    add_rules("qt.quickapp")
    add_files("demos/calqlatr/calqlatr.qrc")
    add_files("demos/calqlatr/main.cpp")
target("clocks")
    add_rules("qt.quickapp")
    add_files("demos/clocks/clocks.qrc")
    add_files("demos/clocks/*.cpp")
    -- add_files("demos/qml3clocksdoscilloscope/*.h")-- add files with Q_OBJECT meta (only for qt.moc),not add_includedirs,or add_headerfiles
target("coffee")
    add_rules("qt.quickapp")
    add_files("demos/coffee/qml.qrc")
    add_files("demos/coffee/*.cpp")
    add_includedirs("demos/coffee")
target("hangman")
    add_rules("qt.quickapp")
    add_files("demos/hangman/resources.qrc")
    add_files("demos/hangman/*.cpp")
    add_files("demos/hangman/*.h")
target("maroon")
    add_rules("qt.quickapp")
    add_files("demos/maroon/maroon.qrc")
    add_files("demos/maroon/*.cpp")
    -- add_files("demos/maroon/*.h")
target("samegame")
    add_rules("qt.quickapp")
    add_files("demos/samegame/samegame.qrc")
    add_files("demos/samegame/*.cpp")
    -- add_files("demos/qmlmultigraph/*.h")
target("tweetsearch")
    add_rules("qt.quickapp")
    add_files("demos/tweetsearch/tweetsearch.qrc")
    add_files("demos/tweetsearch/*.cpp")
    -- add_files("demos/tweetsearch/*.h")

    
    

    

