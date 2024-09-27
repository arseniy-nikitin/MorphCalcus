#include "models/input_field/input_field.hh"
#include "gtest/gtest.h"

// namespace Morph::Tests {

TEST(DateInputField, Validation) {
    Morph::Models::DateInputField date;
    date.append("2001.12.24");
    EXPECT_EQ(date.getValue(), "2001.12.24");
}

// } // namespace Morph::Tests

int main(int nArgs, char** vArgs) {
    ::testing::InitGoogleTest(&nArgs, vArgs);
    return RUN_ALL_TESTS();
}
