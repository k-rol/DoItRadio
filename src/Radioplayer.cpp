/*
 * Radioplayer.cpp
 *
 *  Created on: 2014-04-30
 *      Author: CaroL
 */

#include "Radioplayer.h"
#include <bb/multimedia/MediaPlayer>

using namespace bb::multimedia;

Radioplayer::Radioplayer(QObject* parent)
	: QObject(parent)
	, radio_player(new MediaPlayer(this))
{
}

void Radioplayer::playThis(const QUrl &station)
{
	radio_player->setSourceUrl(station);
	radio_player->play();
}

Radioplayer::~Radioplayer(){
	// TODO Auto-generated destructor stub
}

