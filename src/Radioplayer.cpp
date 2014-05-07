/*
 * Radioplayer.cpp
 *
 *  Created on: 2014-04-30
 *      Author: cauellet
 */

#include "Radioplayer.h"
#include <bb/multimedia/MediaPlayer>
#include <QDebug>
#include <QThread>
#include <QtConcurrentRun>
#include <QFuture>


Radioplayer::Radioplayer(QObject *parent)
	: QObject(parent)
	, mediaPlayer_Radio(new MediaPlayer(this))
{
}

void Radioplayer::playThis(const QUrl &station)
{
	checkState(station);
	checkError();
}

void Radioplayer::stopThis()
{
	mediaPlayer_Radio->stop();
	mediaPlayer_Radio->reset();
	emit playingStarted("Play");
}

void Radioplayer::checkState(const QUrl &station)
{
	if(mediaPlayer_Radio->mediaState() == MediaState::Prepared || mediaPlayer_Radio->mediaState() == MediaState::Started)
	{
		emit playingStarted("Paused");
		mediaPlayer_Radio->pause();

	}
	else if (mediaPlayer_Radio->mediaState() == MediaState::Unprepared || mediaPlayer_Radio->mediaState() == MediaState::Stopped)
	{
		emit playingStarted("Playing..");
		mediaPlayer_Radio->setSourceUrl(station);
		//emit playNow();
		//mediaPlayer_Radio->play();
		extern void aFunction();
		QFuture<void> future = QtConcurrent::run(playThatNow);


	}
	else if (mediaPlayer_Radio->mediaState() == MediaState::Paused)
	{
		emit playingStarted("Playing..");
		mediaPlayer_Radio->play();

	}
}

void Radioplayer::playThatNow(void)
{
	mediaPlayer_Radio->play();
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

