#include "loginuihandler.h"
#include "webloginwindow.h"
#include <QUrl>

LoginUIHandler::LoginUIHandler(QApplication& app) : app(app) {
}

void LoginUIHandler::onStopRequested() {
    app.quit();
}

void LoginUIHandler::openBrowser(QString const& url, simpleipc::server::rpc_handler::result_handler const& handler) {
    WebLoginWindow* window = new WebLoginWindow(QUrl(url));
    connect(window, &QDialog::finished, [window, handler](int result) {
        if (result == QDialog::Accepted) {
            nlohmann::json res;
            auto& prop = res["properties"] = nlohmann::json::object();
            for (auto it = window->properties().begin(); it != window->properties().end(); it++)
                prop[it.key().toStdString()] = it.value().toStdString();
            handler(simpleipc::rpc_json_result::response(res));
        } else {
            handler(simpleipc::rpc_json_result::error(-501, "Operation cancelled by user"));
        }
        window->deleteLater();
    });
    window->open();
}