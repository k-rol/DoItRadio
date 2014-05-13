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
        	},
            MediaPlayer {
                id: radiox
                sourceUrl: "http://stream.rncmedia.ca/choi.mp3"
                onMediaStateChanged: {
                    switch (radiox.mediaState) {
                        case MediaState.Unprepared:
                        	playButton.text = "Play"
                        	stopButton.enabled = false
                        	break;
                        case MediaState.Stopped:
                            playButton.text = "Play"
                            stopButton.enabled = false
                        	break;
                        case MediaState.Prepared:
                            playButton.text = "Pause"
                        	stopButton.enabled = true
                        	break;
                        case MediaState.Started:
                            playButton.text = "Pause"
                        	stopButton.enabled = true
                        	break;
                    }
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
        
        Container { //banner + radioxlogo + buttons
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
                            text: "Québec"
                            textFit.minFontSizeValue: 12.0
                            textFit.maxFontSizeValue: 17.0
                            textStyle.color: Color.Black
                        }    
                    }
                
                }
                ActivityIndicator {
                    id: inProcess
                    preferredHeight: 130
                    preferredWidth: 130
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                }  
                ImageView {
                    imageSource: "asset:///images/choiQuebec.png"
                
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
                        SystemToast {
                            id: alertbuffering
                            body: qsTr("Buffering...")
                        }
                    ]
                    text: qsTr("Play") + Retranslate.onLocaleOrLanguageChanged
                    onClicked: {
                        //inProcess.running = true
                        
                        radioplayer.playThis("http://stream.rncmedia.ca/choi.mp3")
                        
                        //playRadio()
                        
                    }
                }

                Button {
                    id: stopButton
                    text: qsTr("Stop") + Retranslate.onLocaleOrLanguageChanged
                    onClicked: {
                        radioplayer.stopThis()
/*                        radiox.reset()
                        if (radiox.stop() != MediaError.None) {
                            // Put your error handling code here
                        }*/
                    }
                    onCreationCompleted: {
                        stopButton.clicked()
                    }
                }

            }
        }
    
    }
    function playRadio(){
        
        console.debug("Before Ifs")
        console.debug(radiox.mediaState.Stopped)
        console.debug(radiox.mediaState.Unprepared)
        console.debug(radiox.mediaState.Paused)
        if (radiox.mediaState.Stopped || radiox.mediaState.Unprepared || radiox.mediaState.Paused) 
        {
            console.debug("should play here")
            alertbuffering.show()
            var errorMsg = radiox.play()
            
            switch (errorMsg) {
                case MediaError.None:
                    break;
                case MediaError.UnsupportedOperation:
                    radiox.stop()
                    radiox.reset()
                    radiox.play()
                    break;
                default:
                    alertconnect.show()
                    break;
            }
        }
        else if (radiox.mediaState.Started || radiox.mediaState.Prepared)
        {
            console.debug("should pause here")
            radiox.pause()
        }
        console.debug("After Ifs")
        inProcess.stop()
    }//End playRadio function
}
