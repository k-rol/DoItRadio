/*
 * XPlayer.cpp
 *
 *  Created on: 2014-04-02
 *      Author: cauellet
 */

#include "XPlayer.h"
#include <QDebug>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QTimer>
#include <QUrl>

XPlayer::XPlayer(QObject* parent)
: QObject(parent)
, m_networkAccessManager(new QNetworkAccessManager(this)) {
	// TODO Auto-generated constructor stub
}

void XPlayer::playRadio(const QString &radioLink)
{

}

XPlayer::~XPlayer() {
	// TODO Auto-generated destructor stub
}

