/*
 * Radioplayer.cpp
 *
 *  Created on: 2014-04-30
 *      Author: cauellet
 */

#include "Radioplayer.h"
#include <bb/multimedia/MediaPlayer>


Radioplayer::Radioplayer(QObject *parent)
	: QObject(parent)
	, mediaPlayer_Radio(new MediaPlayer(this))
{
}

void Radioplayer::playThis(const QUrl &station)
{
	mediaPlayer_Radio->setSourceUrl(station);
	mediaPlayer_Radio->play();
}

Radioplayer::~Radioplayer() {
	// TODO Auto-generated destructor stub
}

