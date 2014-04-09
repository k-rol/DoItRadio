import bb.cascades 1.2
import bb.multimedia 1.0

Page {
    Container {
        attachedObjects: [
            MediaPlayer {
                id: radiox
                sourceUrl: "http://stream.rncmedia.ca/cklx.mp3"
            }
        ]
        
        background: Color.Black
        Label {
            text: "by DoIt Radio"
            textStyle.color: Color.create("#fff0f0f0")
            horizontalAlignment: HorizontalAlignment.Right
        }
        Container {
            bottomMargin: 35.0
        
        }
        Container {
            layout: DockLayout {
            
            }
            
            Container {
                
                background: Color.create("#ffffe55d")
                preferredWidth: 800.0
                preferredHeight: 200.0
                verticalAlignment: VerticalAlignment.Bottom
                Container {
                    horizontalAlignment: HorizontalAlignment.Center
                    leftMargin: 0.0
                    leftPadding: 200.0
                    topPadding: 50.0
                    Label {
                        text: "Montréal"
                        textFit.minFontSizeValue: 12.0
                        textFit.maxFontSizeValue: 17.0
                        textStyle.color: Color.Black
                    }    
                }
            
            }
            ImageView {
                imageSource: "asset:///images/cklxMontreal.png"
            
            }
        
        
        }
        
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            
            }
            
            topMargin: 100.0
            horizontalAlignment: HorizontalAlignment.Center
            Button {
                text: qsTr("Play") + Retranslate.onLocaleOrLanguageChanged
                onClicked: {
                    if (radiox.play() != MediaError.None) {
                        // Put your error handling code here
                    }
                }
            }
            Button {
                text: qsTr("Stop") + Retranslate.onLocaleOrLanguageChanged
                onClicked: {
                    radiox.reset()
                    if (radioxquebec.stop() != MediaError.None) {
                        // Put your error handling code here
                    }
                }
            }  
        }
        
    }
}
