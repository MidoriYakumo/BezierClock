/************************************************************************************
** The MIT License (MIT)
**
** Copyright (c) 2016 Serg "EXL" Koles <exlmotodev@gmail.com>
**
** Permission is hereby granted, free of charge, to any person obtaining a copy
** of this software and associated documentation files (the "Software"), to deal
** in the Software without restriction, including without limitation the rights
** to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
** copies of the Software, and to permit persons to whom the Software is
** furnished to do so, subject to the following conditions:
**
** The above copyright notice and this permission notice shall be included in all
** copies or substantial portions of the Software.
**
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
** IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
** FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
** AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
** LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
** OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
** SOFTWARE.
************************************************************************************/

import QtQuick 2.0
import QtQuick.Controls 1.0

import org.kde.plasma.core 2.0 // For units

import 'JsConfigUiHelper.js' as ConfigUiHelper

Row {
    id: root

    // All settings
    property alias cfg_BackgroundColor: colorBackgroundBox.colorTo
    property alias cfg_DigitColor: colorDigitBox.colorTo
    property alias cfg_ShadowColor: colorShadowBox.colorTo
    property alias cfg_ControlLinesColor: colorLinesBox.colorTo
    property alias cfg_SquaresColor: colorRectsBox.colorTo

    property alias cfg_ContinualAnimation: continualAnimationCheckBox.checked
    property alias cfg_ContinualShadows: continualShadowsCheckBox.checked
    property alias cfg_ControlLines: controlLinesCheckBox.checked
    property alias cfg_ShowFps: showFpsCheckBox.checked

    property alias cfg_ScalingValue: scalingSpinBox.spinBoxValue
    property alias cfg_DurationAnim: durationsSpinBox.spinBoxValue
    property alias cfg_FrameRate: fpsLimitSpinBox.spinBoxValue
    property alias cfg_DigitWidth: digitsWidthSpinBox.spinBoxValue
    property alias cfg_ShadowWidth: shadowsWidthSpinBox.spinBoxValue
    property alias cfg_LinesWidth: linesWidthSpinBox.spinBoxValue
    property alias cfg_CirclesRadius: circlesRadiusSpinBox.spinBoxValue

    property alias cfg_DigitCap: digitCapComboBox.comboBoxIndex
    property alias cfg_AnimationType: animationTypeComboBox.comboBoxIndex

    property alias cfg_ShowDots: showDotsCheckBox.checked
    property alias cfg_BlinkDots: blinkCheckBox.checked
    property alias cfg_RadiusDots: radiusDotsSpinBox.spinBoxValue

    spacing: units.smallSpacing

    Column {
        spacing: units.smallSpacing

        GroupBox {
            title: qsTr('Main Settings')
            id: mainGroupBox // This is element with biggest width

            Column {
                spacing: units.smallSpacing

                UiComboBox {
                    id: animationTypeComboBox
                    labelText: qsTr('Animation')
                    modelTo: [qsTr('Linear'), qsTr('Quadratic'), qsTr('Cubic'),
                        qsTr('Sinuisoidial'), qsTr('No animation')]
                    onComboBoxIndexChanged: {
                        if (comboBoxIndex == 4) {
                            durationsSpinBox.enabled = false
                        } else {
                            durationsSpinBox.enabled = true
                        }
                    }
                }

                UiSpinBox {
                    id: scalingSpinBox
                    minValue: 1
                    maxValue: 20
                    stepValue: 1
                    labelText: qsTr('Scaling Value')
                }

                UiSpinBox {
                    id: durationsSpinBox
                    minValue: 0
                    maxValue: 10000
                    stepValue: 1
                    labelText: qsTr('Animation Duration')
                }

                CheckBox {
                    id: continualAnimationCheckBox
                    text: qsTr('Continual Animation')
                    onCheckedChanged: {
                        if (checked == true) {
                            continualShadowsCheckBox.checked = false;
                        }
                    }
                }

                UiColorBox {
                    id: colorBackgroundBox
                    titleDialog: qsTr('Select Background Color')
                    labelText: qsTr('Background Color')
                }
            }
        }

        GroupBox {
            title: qsTr('Digits Settings')
            width: mainGroupBox.width

            Column {
                spacing: units.smallSpacing

                UiSpinBox {
                    id: digitsWidthSpinBox
                    minValue: 1
                    maxValue: 100
                    stepValue: 1
                    labelText: qsTr('Digits Width')
                }

                UiComboBox {
                    id: digitCapComboBox
                    labelText: qsTr('Digits Cap')
                    modelTo: [qsTr('Butt'), qsTr('Round'), qsTr('Square')]
                }

                UiColorBox {
                    id: colorDigitBox
                    titleDialog: qsTr('Select Digits Color')
                    labelText: qsTr('Digits Color')
                }
            }
        }

        Label {
            id: aboutLabel
            visible: false
            onLinkActivated: Qt.openUrlExternally(link)
            text: qsTr('<br><br><strong>Bezier Clock</strong> v1.0<br><br>'+
                       'Port to KDE Plasma 5: © <font color="orange"><b>EXL</b></font>, 2016<br>' +
                       '<a href="http://exlmoto.ru/bezier-clock">http://exlmoto.ru/bezier-clock</a><br>' +
                       '<a href="https://github.com/EXL/BezierClock">https://github.com/EXL/BezierClock</a><br>' +
                       '<a href="mailto:exl@bk.ru">exl@bk.ru</a> | <a href="mailto:exlmotodev@gmail.com">exlmotodev@gmail.com</a><br><br>' +
                       'Original: © <font color="green"><b>Jack Frigaard</b></font>, 2014<br>' +
                       '<a href="http://frigaardj.github.io/bezier-clock/">http://frigaardj.github.io/bezier-clock</a>')
        }
    }

    Column {
        spacing: units.smallSpacing

        GroupBox {
            title: qsTr('Continual Shadows')
            width: mainGroupBox.width

            Column {
                spacing: units.smallSpacing

                CheckBox {
                    id: continualShadowsCheckBox
                    text: qsTr('Show Continual Shadows')
                    onCheckedChanged: {
                        if (checked == true) {
                            continualAnimationCheckBox.checked = false;
                        }
                    }
                }

                UiSpinBox {
                    id: shadowsWidthSpinBox
                    enabled: continualShadowsCheckBox.checked
                    minValue: 1
                    maxValue: 100
                    stepValue: 1
                    labelText: qsTr('Shadow Width')
                }

                UiColorBox {
                    id: colorShadowBox
                    enabled: continualShadowsCheckBox.checked
                    titleDialog: qsTr('Select Shadows Color')
                    labelText: qsTr('Shadows Color')
                }
            }
        }

        GroupBox {
            title: qsTr('Control Lines')
            width: mainGroupBox.width

            Column {
                spacing: units.smallSpacing

                CheckBox {
                    id: controlLinesCheckBox
                    text: qsTr('Show Control Lines')
                }

                UiSpinBox {
                    id: linesWidthSpinBox
                    enabled: controlLinesCheckBox.checked
                    minValue: 1
                    maxValue: 100
                    stepValue: 1
                    labelText: qsTr('Control Lines Width')
                }

                UiSpinBox {
                    id: circlesRadiusSpinBox
                    enabled: controlLinesCheckBox.checked
                    minValue: 1
                    maxValue: 100
                    stepValue: 1
                    labelText: qsTr('Shapes Radius')
                }

                UiColorBox {
                    id: colorLinesBox
                    enabled: controlLinesCheckBox.checked
                    titleDialog: qsTr('Select Lines Color')
                    labelText: qsTr('Lines Color')
                }

                UiColorBox {
                    id: colorRectsBox
                    enabled: controlLinesCheckBox.checked
                    titleDialog: qsTr('Select Squares Color')
                    labelText: qsTr('Squares Color')
                }
            }
        }
    }

    Column {
        spacing: units.smallSpacing

        GroupBox {
            title: qsTr('FPS settings')
            width: mainGroupBox.width

            Column {
                spacing: units.smallSpacing

                UiSpinBox {
                    id: fpsLimitSpinBox
                    minValue: 1
                    maxValue: 1000
                    stepValue: 1
                    labelText: qsTr('FPS Limit')
                }

                CheckBox {
                    id: showFpsCheckBox
                    text: qsTr('Show FPS')
                }
            }
        }

        GroupBox {
            title: qsTr('Dots Settings')
            width: mainGroupBox.width

            Column {
                spacing: units.smallSpacing

                CheckBox {
                    id: showDotsCheckBox
                    text: qsTr('Show Dots')
                }

                CheckBox {
                    id: blinkCheckBox
                    text: qsTr('Blink Dots')
                    enabled: showDotsCheckBox.checked
                }

                UiSpinBox {
                    id: radiusDotsSpinBox
                    enabled: showDotsCheckBox.checked
                    minValue: 1
                    maxValue: 50
                    stepValue: 1
                    labelText: qsTr('Dots Radius')
                }
            }
        }

        Row {
            spacing: units.smallSpacing

            Image {
                id: image
                source: '../icon/BC_icon.png'
            }

            Column {
                spacing: units.smallSpacing

                Button {
                    id: resetButton
                    width: mainGroupBox.width - image.width - units.smallSpacing
                    anchors.top: image.top

                    text: qsTr('Reset to Default')
                    tooltip: qsTr('Reset all settings to Default')

                    onClicked: {
                        ConfigUiHelper.resetToDefault();
                    }
                }

                Button {
                    id: aboutButton
                    width: mainGroupBox.width - image.width - units.smallSpacing
                    anchors.bottom: image.bottom

                    property bool showLabel: true
                    property string show: qsTr('Show About')
                    property string hide: qsTr('Hide About')

                    text: show
                    tooltip: qsTr('Show/Hide About Information')

                    onClicked: {
                        aboutLabel.visible = !aboutLabel.visible;
                        showLabel = !showLabel;
                        text = (showLabel) ? show : hide;
                    }
                }
            }
        }
    }
}
