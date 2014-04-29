import bb.cascades 1.2
import bb.multimedia 1.0
import bb.system 1.2

Page {
    Container {
        attachedObjects: [
            MediaPlayer {
                id: radiox
                sourceUrl: "http://stream.rncmedia.ca/chicoutimi.radiox.mp3"
            }
        ]
        background: Color.Black

        
        ImageView {
            imageSource: "asset:///images/radio%20noyellow%20image.png"
            horizontalAlignment: HorizontalAlignment.Right
        
        }
        
        Label {
            text: qsTr("You are listening to:") + Retranslate.onLocaleOrLanguageChanged
            textStyle.color: Color.create("#fff0f0f0")
            horizontalAlignment: HorizontalAlignment.Left
            translationY: -50.0
        }
        
        Container {//banner + radioxlogo + buttons
            translationY: -50.0
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
                            text: "Saguenay"
                            textFit.minFontSizeValue: 12.0
                            textFit.maxFontSizeValue: 17.0
                            textStyle.color: Color.Black
                        }    
                    }
                
                }
                ImageView {
                    imageSource: "asset:///images/ckykSaguenay.png"
                
                }
            
            
            }
            
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                
                }
                
                topMargin: 100.0
                horizontalAlignment: HorizontalAlignment.Center
                Button {
                    attachedObjects: [
                        SystemToast {
                            id: alertconnect
                            body: qsTr("Can't connec to station...")
                        }
                    ]
                    text: qsTr("Play") + Retranslate.onLocaleOrLanguageChanged
                    onClicked: {
                        if (radiox.play() == MediaError.UnsupportedOperation)
                        {
                            radiox.stop()
                            radiox.reset()
                            if (radiox.play() != MediaError.None) {
                                alertconnect.show()
                            }
                        }
                        else if (radiox.play() != MediaError.None) {
                            alertconnect.show()
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
}
