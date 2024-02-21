# qt6 xmake

## xmake

```lua

 add_files("datavisualization/qml3doscilloscope/*.h")-- add files with Q_OBJECT meta (only for qt.moc),not add_includedirs,or add_headerfiles
```

## .qrc

if no main.qml
```qrc
<qresource prefix="/demos/tweetsearch">
```
if have main.qml
```qrc
<qresource prefix="/">
```
## import other qml 

    -- add_includedirs("quickcontrols2/flatstyle/imports")

    
## -- TODO: import user modules





 