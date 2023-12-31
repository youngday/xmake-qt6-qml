/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick
import QtQuick3D
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: window
    visible: true
    width:  800
    height: 800
    title: qsTr("Morphing Example")

    Frame {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 10
        background: Rectangle {
            color : "transparent"
        }
        RowLayout {
            width: parent.width
            spacing: 10
//! [sliders]
            Label { text: "Mouth:" }
            RealSlider {
                id: mouthSlider
                from: 0.0
                to: 1.0
            }
            Label { text: "Ears and eyebrows:" }
            RealSlider {
                id: earSlider
                from: 0.0
                to: 1.0
            }
            Label { text: "Cubify:" }
            RealSlider {
                id: cubeSlider
                from: 0.0
                to: 1.0
            }
//! [sliders]
        }
        z:1
    }
    View3D {
        id: view
        anchors.fill: parent

        environment: SceneEnvironment {
            clearColor: "gray"
            backgroundMode: SceneEnvironment.Color
        }

        PerspectiveCamera {
            id: camera
            position.z: 3.0
            position.y: 0.75
            eulerRotation.x: -12
            clipNear: 1.0
            clipFar: 60.0
        }

        DirectionalLight {
            eulerRotation.x: -30
            eulerRotation.y: -70
            ambientColor: Qt.rgba(0.3, 0.3, 0.3, 1.0)
        }

//! [morphtargets]
        MorphTarget {
            id: morphtarget0
            weight: mouthSlider.value
            attributes: MorphTarget.Position | MorphTarget.Normal
        }
        MorphTarget {
            id: morphtarget1
            weight: earSlider.value
            attributes: MorphTarget.Position | MorphTarget.Normal
        }
        MorphTarget {
            id: morphtarget2
            weight: cubeSlider.value
            attributes: MorphTarget.Position | MorphTarget.Normal
        }
//! [morphtargets]

//! [model]
        Model {
            source: "suzanne.mesh"
            morphTargets: [
                morphtarget0,
                morphtarget1,
                morphtarget2
            ]
            materials: PrincipledMaterial {
                baseColor: "#41cd52"
                roughness: 0.1
            }
            SequentialAnimation on eulerRotation.y {
                NumberAnimation { from: -45; to: 45; duration: 10000 }
                NumberAnimation { from: 45; to: -45; duration: 10000 }
                loops: Animation.Infinite
            }
        }
//! [model]
    }
}
