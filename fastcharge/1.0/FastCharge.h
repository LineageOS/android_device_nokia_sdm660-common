// FIXME: your file license if you have one

#pragma once

#include <vendor/lineage/fastcharge/1.0/IFastCharge.h>
#include <hidl/MQDescriptor.h>
#include <hidl/Status.h>

namespace vendor::lineage::fastcharge::implementation {

using ::android::hardware::hidl_array;
using ::android::hardware::hidl_memory;
using ::android::hardware::hidl_string;
using ::android::hardware::hidl_vec;
using ::android::hardware::Return;
using ::android::hardware::Void;
using ::android::sp;

struct FastCharge : public V1_0::IFastCharge {
    // Methods from ::vendor::lineage::fastcharge::V1_0::IFastCharge follow.
    Return<bool> isEnabled() override;
    Return<bool> setEnabled(bool enable) override;

};

}  // namespace vendor::lineage::fastcharge::implementation

