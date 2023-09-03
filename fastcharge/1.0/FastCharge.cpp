// FIXME: your file license if you have one

#include "FastCharge.h"
#include <fstream>

#define LOG_TAG "FastChargeService"
#include <log/log.h>

namespace vendor::lineage::fastcharge::implementation {

// Methods from ::vendor::lineage::fastcharge::V1_0::IFastCharge follow.

// Note: this function returns 1 on errors, since it is safest to assume fast charging is ON
Return<bool> FastCharge::isEnabled() {
    char status;

    std::fstream ctrl_file ("/sys/class/qcom-battery/restricted_charging", std::fstream::in);
    if (ctrl_file) {
        status = ctrl_file.get();
        ctrl_file.close();
    } else {
        ALOGE ("Error reading /sys/class/qcom-battery/restricted-charging");
        return 1;
    }

    switch (status) {
        case '0': return true;
        case '1': return false;
    }

    ALOGE ("/sys/class/qcom-battery/restricted-charging: Unknown status: %c", status);
    return 1;
}

Return<bool> FastCharge::setEnabled(bool enabled) {
    char status = enabled ? '0' : '1';
    ALOGI ("Attempting to set fastcharge enabled status to %d", enabled);

    std::fstream ctrl_file ("/sys/class/qcom-battery/restricted_charging", std::fstream::out);
    if (ctrl_file) {
        ctrl_file.put(status);
        ctrl_file.close();
    } else {
        ALOGE ("Error writing /sys/class/qcom-battery/restricted_charging");
        return 1;
    }

    return 0;
}
}  // namespace vendor::lineage::fastcharge::implementation

