# Generated from multimedia.pro.

qt_internal_add_example(audiodecoder)
if(NOT ANDROID AND NOT IOS)
    qt_internal_add_example(devices)
endif()
if(TARGET Qt::Widgets)
    qt_internal_add_example(spectrum)
    qt_internal_add_example(audiorecorder)
    if(NOT ANDROID AND NOT IOS)
        qt_internal_add_example(audiodevices)
    endif()
    qt_internal_add_example(audiosource)
    qt_internal_add_example(audiooutput)
endif()
if(TARGET Qt::Quick)
    qt_internal_add_example(declarative-camera)
    add_subdirectory(video)
endif()
