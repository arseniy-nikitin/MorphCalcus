#include "datestring.hh"
#include "gtest/gtest.h"

namespace Morph::Tests {

TEST(DateString, TestPlug) {
    DateString date;
    date.setDate("11.09.2001");
    EXPECT_EQ(date.date(), "11.09.2001");
}

}

int main(int nArgs, char** vArgs) {
    ::testing::InitGoogleTest(&nArgs, vArgs);
    return RUN_ALL_TESTS();
}
