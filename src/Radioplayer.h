/*
 * Radioplay.h
 *
 *  Created on: 2014-04-30
 *      Author: cauellet
 */

#ifndef RADIOPLAYER_H_
#define RADIOPLAYER_H_
#include <QObject>
#include <bb/multimedia/MediaPlayer>

//class bb::multimedia::MediaPlayer;

using namespace bb::multimedia;

class Radioplayer : public QObject {

	Q_OBJECT
public:
	Radioplayer(QObject* parent = 0);
	virtual ~Radioplayer();

public Q_SLOTS:
	void playThis(const QUrl &station);
	void stopThis();

private:
	void checkError();
	MediaPlayer* mediaPlayer_Radio;

};

#endif /* RADIOPLAY_H_ */
