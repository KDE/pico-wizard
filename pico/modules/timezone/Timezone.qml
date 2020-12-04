import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import QtQuick.Controls.Material.impl 2.15

import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.kirigami 2.7 as Kirigami

import PicoWizard 1.0

Module {
    id: root
    moduleName: timezoneModule.moduleName()
    moduleIcon: timezoneModule.dir() + "/assets/timezone.svg"
    moduleIconColor: "#ff999999"

    delegate: Item {
        ColumnLayout {
            anchors {
                top: parent.top
                bottom: nextButton.top
                bottomMargin: 16
                horizontalCenter: parent.horizontalCenter
            }

            PlasmaComponents.TextField {
                id: searchText
                Layout.preferredWidth: root.width * 0.6
                Layout.preferredHeight: 64
                placeholderText: "Timezone"

                onTextChanged: {
                    timezoneModule.filterText = text
                }
            }

            Rectangle {
                id: tzContainer
                Layout.preferredWidth: root.width * 0.6
                Layout.fillHeight: true

                radius: 4
                border.width: 2
                border.color: "#fff0f0f0"
                color: "#fff5f5f5"

                ScrollIndicator {
                    id: tzScroll
                    width: 12
                    anchors {
                        top: tzContainer.top
                        right: tzContainer.right
                        bottom: tzContainer.bottom
                    }
                }

                ListView {
                    anchors.fill: parent
                    anchors.margins: 16

                    spacing: 4
                    model: timezoneModule.model
                    clip: true
                    ScrollIndicator.vertical: tzScroll

                    delegate: Rectangle {
                        width: parent ? parent.width : 0
                        height: 60

                        Label {
                            anchors {
                                verticalCenter: parent.verticalCenter
                                left: parent.left
                                leftMargin: 12
                            }

                            text: tz
                        }
                    }
                }
            }
        }

        NextButton {
            id: nextButton
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
                bottomMargin: 16
            }
        }
    }

    TimezoneModule {
        id: timezoneModule
    }
}
