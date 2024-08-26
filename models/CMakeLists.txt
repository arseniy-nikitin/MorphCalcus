qt_add_library(Models STATIC)

set_target_properties(Models PROPERTIES AUTOMOC ON)
target_link_libraries(Models PRIVATE Qt6::Quick)

qt_add_qml_module(Models
    URI Models
    VERSION 1.0
    RESOURCE_PREFIX /arseniy.nikitin/imports
    SOURCES
        calculatorfacade.hh calculatorfacade.cc
        calculatormodel.hh calculatormodel.cc
        creditmodel.hh creditmodel.cc
        debitmodel.hh debitmodel.cc
        transactionmodel.hh transactionmodel.cc
        
        SOURCES creditfacade.hh creditfacade.cc


)
