/*
 * XPlayer.h
 *
 *  Created on: 2014-04-02
 *      Author: cauellet
 */

#ifndef XPLAYER_H_
#define XPLAYER_H_

class QNetworkAccessManager;

#include <QObject>

class XPlayer: public QObject {
	Q_OBJECT
public:
	XPlayer(QObject* parent = 0);
	virtual ~XPlayer();

public Q_SLOTS:
	void playRadio(const QString &radioLink);

private:
	QNetworkAccessManager* m_networkAccessManager;
};

#endif /* XPLAYER_H_ */
