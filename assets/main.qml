/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2
import bb.multimedia 1.0

TabbedPane {
	id: myTabbedPane
	
    property int defaultChannel: doitsettings.getSettings("DefaultChannel")
	activeTab: if (defaultChannel == 0)	{activeTab: quebecTab}
	else if (defaultChannel == 1){activeTab: montrealTab}
	else if (defaultChannel == 2){activeTab: saguenayTab}
	else if (defaultChannel == 3){activeTab: rockX2Tab}
	
    attachedObjects: [
        Settings {
            id: settings
        }
        
    ]
    Menu.definition: MenuDefinition {
        helpAction: HelpActionItem {
        
        }
        settingsAction: SettingsActionItem {
            onTriggered: {
                settings.open()
            }
        }
    
    }
    showTabsOnActionBar: true
    Tab { //First tab
        // Localized text with the dynamic translation and locale updates support
        title: qsTr("Québec")
        id: quebecTab
        delegate: Delegate {
            id: delegatequebectab
            source: "Quebec.qml"
        }
        delegateActivationPolicy: TabDelegateActivationPolicy.ActivatedWhileSelected
        imageSource: "asset:///images/choiQuebec.png"

    } //End of first tab
    Tab { //Second tab
        title: qsTr("Montréal")
        id: montrealTab
        delegate: Delegate {
            id: delegatemontrealtab
            source: "Montreal.qml"
        }
        delegateActivationPolicy: TabDelegateActivationPolicy.ActivatedWhileSelected
        imageSource: "asset:///images/radio9%20white.png"
        

    } //End of second tab
    
    Tab { //Third tab
        title: qsTr("Saguenay")
        id: saguenayTab
        delegate: Delegate {
            id: delegatesaguenaytab
            source: "Saguenay.qml"
        }
        delegateActivationPolicy: TabDelegateActivationPolicy.ActivatedWhileSelected
        imageSource: "asset:///images/ckykSaguenay.png"

    } //End of Third tab
    
    Tab { //Fourth tab
        title: qsTr("Rock X 2")
        id: rockX2Tab
        delegate: Delegate {
            id: delegaterockx2tab
            source: "RockX2.qml"
        }
        delegateActivationPolicy: TabDelegateActivationPolicy.ActivatedWhileSelected
        imageSource: "asset:///images/chxxRock.png"

    } //End of fourth tab
}
