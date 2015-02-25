/*
 * SqlDataSource.cpp
 *
 *  Created on: Feb 25, 2015
 *      Author: cauellet
 */

#include <SqlDataSource.h>

SqlDataSource::SqlDataSource(QObject *parent) :
        QObject(parent), mpSqlConnector(0), mDataModel(0), mDataModel2(0)
{
    // TODO Auto-generated constructor stub

}

void SqlDataSource::onLoadData()
{
    // First time only: create an SqlConnection (called mpSqlConnector here) to establish
    // a connection thread to a database and process multiple queries during the life of the
    // application.
    if (!mpSqlConnector) {
        // A) Establish connection thread to database
        mpSqlConnector = new SqlConnection("doitradiolist.db", this);

        // B) Use signals and slots to get results data when it's ready
        connect( mpSqlConnector, SIGNAL(reply(const bb::data::DataAccessReply&)),
                this, SLOT(onLoadResultData(const bb::data::DataAccessReply&)) );
    }

    // C) Load 20 rows, add them to model using onLoadResultData()
    mpSqlConnector->beginTransaction();
    DataAccessReply reply = mpSqlConnector->executeAndWait("select link FROM channels WHERE Title LIKE 'Radio X Q%'");
    onLoadResultData(reply);
    if (reply.hasError()) {
        mpSqlConnector->rollbackTransaction();
    }
    else {
        // D) Load another 1000 rows
        mpSqlConnector->execute("select link FROM channels WHERE Title LIKE 'Radio X Q%'");
        mpSqlConnector->endTransaction();
    }
}

void SqlDataSource::onLoadResultData(const DataAccessReply& reply) {
    if (reply.hasError()) {
        // This adds message to console - better to inform the user by updating the UI
        qWarning() << "Error while retrieving data from SQL database: " << reply;
    }
    else {
        // Append data to the end of QListDataModel (called mDataModel here)
        QVariant results = reply.result();
        mDataModel->append(results.value<QVariantList>());



    }
}

SqlDataSource::~SqlDataSource()
{
    // TODO Auto-generated destructor stub
}

