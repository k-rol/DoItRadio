/*
 * Radioplayer.h
 *
 *  Created on: 2014-04-30
 *      Author: CaroL
 */

#ifndef RADIOPLAYER_H_
#define RADIOPLAYER_H_

#include <bb/multimedia/MediaPlayer>
#include <QObject>
class bb::multimedia::MediaPlayer;

using namespace bb::multimedia;
/*
 *
 */
class Radioplayer : public QObject {
	Q_OBJECT
public:
	Radioplayer(QObject* parent=0);
	virtual ~Radioplayer();

public Q_SLOTS:
	void playThis(const QUrl &station);

private:
	MediaPlayer* radio_player;
};

#endif /* RADIOPLAYER_H_ */
