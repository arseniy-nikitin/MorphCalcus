#include "models/input_field/input_field.hh"
#include "gtest/gtest.h"

// namespace Morph::Tests {

TEST(IntegerInputField, Validation) {
    Morph::Models::IntegerInputField integer;
    integer.append("1234");
    EXPECT_EQ(integer.getValue(), "1234");
}

// } // namespace Morph::Tests

int main(int nArgs, char** vArgs) {
    ::testing::InitGoogleTest(&nArgs, vArgs);
    return RUN_ALL_TESTS();
}
