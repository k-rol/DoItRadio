import bb.cascades 1.2
import bb.multimedia 1.0
import bb.system 1.2
import Radioplayer 1.0

Page {
    Container {
        attachedObjects: [
            Radioplayer {
                id: radioplayer
                onPlayingStarted: {
                    playButton.text = buttonState
                }
                onPlayNow: {
                    radioplayer.playThatNow()
                }
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
                    preferredWidth: 1440.0
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
                    id: playButton
                    attachedObjects: [
                        SystemToast {
                            id: alertconnect
                            body: qsTr("Can't connec to station...")
                        },
                        ImplicitAnimationController {
                            enabled: false
                            propertyName: playButton.text

                        }
                    ]
                    text: qsTr("Play") + Retranslate.onLocaleOrLanguageChanged
                    onClicked: {
                        radioplayer.playThis("http://stream.rncmedia.ca/chicoutimi.radiox.mp3")
                    }

                }
                Button {
                    id: stopButton
                    text: qsTr("Stop") + Retranslate.onLocaleOrLanguageChanged
                    onClicked: {
                        radioplayer.stopThis()
                    }
                    onCreationCompleted: {
                        stopButton.clicked()
                    }
                }
            }
        }

    }
}
