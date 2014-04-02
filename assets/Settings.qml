import bb.cascades 1.2


Sheet {
    id: settings
    
    Page {
        titleBar: TitleBar {
            title: qsTr("Settings") + Retranslate.onLocaleOrLanguageChanged
            acceptAction: ActionItem {
                title: qsTr("Close") + Retranslate.onLocaleOrLanguageChanged
                onTriggered: {
                    if (radiogroup_qml.selectedOption.value != null)
                    {
                        doitsettings.setSettings("DefaultChannel",radiogroup_qml.selectedOption.value)    
                    }
                    
                    settings.close()
                }
            }
        }
        Container {
            layout: StackLayout {

            }
            Label {
                text: qsTr("Startup Channel Page") + Retranslate.onLocaleOrLanguageChanged
                textStyle.fontWeight: FontWeight.W500
                textFit.minFontSizeValue: 10.0
                textFit.maxFontSizeValue: 14.0

            }
            RadioGroup {
                enabled: true
                id: radiogroup_qml
                Option { id: quebecStart; text: "Québec"; value: 0}
                Option { id: montrealStart; text: "Montréal"; value: 1}
                Option { id: saguenayStart; text: "Saguenay"; value: 2}
                Option { id: radiox2Start; text: "Radio X 2"; value: 3}
            }
        
        }
        onCreationCompleted: {
            radiogroup_qml.setSelectedIndex(doitsettings.getSettings("DefaultChannel"))
        }
    }
    

    
}