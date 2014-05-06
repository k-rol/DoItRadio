/*
 * Radioplayer.cpp
 *
 *  Created on: 2014-04-30
 *      Author: cauellet
 */

#include "Radioplayer.h"
#include <bb/multimedia/MediaPlayer>
#include <QDebug>


Radioplayer::Radioplayer(QObject *parent)
	: QObject(parent)
	, mediaPlayer_Radio(new MediaPlayer(this))
{
}

void Radioplayer::playThis(const QUrl &station)
{
	QString mediaErrorMsg;

	mediaPlayer_Radio->setSourceUrl(station);
	mediaErrorMsg = mediaPlayer_Radio->play();
	checkError();
}

void Radioplayer::stopThis()
{
	mediaPlayer_Radio->stop();
	mediaPlayer_Radio->reset();
}

void Radioplayer::checkError()
{
	qDebug() << "!!!!!!!!!!!!!";
	qDebug() << mediaPlayer_Radio->mediaError();
	qDebug() << "!!!!!!!!!!!!!";

}


Radioplayer::~Radioplayer() {
	// TODO Auto-generated destructor stub
}

