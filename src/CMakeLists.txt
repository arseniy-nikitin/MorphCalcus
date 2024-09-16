qt_add_library(Models STATIC)

set_target_properties(Models PROPERTIES AUTOMOC ON)
target_link_libraries(Models PRIVATE Qt6::Quick)

qt_add_qml_module(Models
    URI Models
    VERSION 1.0
    RESOURCE_PREFIX /arseniy.nikitin/imports
    SOURCES
        calculatormodel.hh calculatormodel.cc
        calculatorfacade.hh calculatorfacade.cc
        creditmodel.hh creditmodel.cc
        creditfacade.hh creditfacade.cc
        debitmodel.hh debitmodel.cc
        debitfacade.hh debitfacade.cc
        transactionmodel.hh transactionmodel.cc
        datestring.hh
)
