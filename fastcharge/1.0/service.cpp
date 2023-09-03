#include <vendor/lineage/fastcharge/1.0/IFastCharge.h>
#include <hidl/HidlTransportSupport.h>
#include <log/log.h>
#include "FastCharge.h"
#include <fstream>

using vendor::lineage::fastcharge::V1_0::IFastCharge;
using vendor::lineage::fastcharge::implementation::FastCharge;
using android::hardware::configureRpcThreadpool;
using android::hardware::joinRpcThreadpool;
using android::sp;

int main(int /* argc */, char* /* argv */ []) {
    ::android::hardware::configureRpcThreadpool(1 /*threads*/, true /*willJoin*/);

    sp<IFastCharge> fastchg = new FastCharge();
    const android::status_t status = fastchg->registerAsService();
    if (status != ::android::OK) {
        return 1;
    }

    ::android::hardware::joinRpcThreadpool();
    return 1; // joinRpcThreadpool should never return
}

