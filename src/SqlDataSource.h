/*
 * SqlDataSource.h
 *
 *  Created on: Feb 25, 2015
 *      Author: cauellet
 */

#ifndef SQLDATASOURCE_H_
#define SQLDATASOURCE_H_

#include <QObject>
#include <bb/data/DataSource>
#include <bb/cascades/QListDataModel>
#include <bb/data/SqlConnection>

using namespace bb::data;
using namespace bb::cascades;

namespace bb
{
    namespace data
    {
        class SqlConnection;
        class DataSource;
    }
    namespace cascades
    {
        class QListDataModel<QVariant*>;
    }
}


class SqlDataSource: public QObject
{
    Q_OBJECT
public:
    SqlDataSource(QObject *parent = 0);

    void onLoadData();
    void onLoadResultData(const DataAccessReply& reply);

    virtual ~SqlDataSource();

private:
    // Data base connector
    SqlConnection *mpSqlConnector;

    DataSource *mDataModel2;
    QListDataModel<QVariant> *mDataModel;

};

#endif /* SQLDATASOURCE_H_ */
