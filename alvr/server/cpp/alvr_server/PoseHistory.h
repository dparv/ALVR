#pragma once

#include <list>
#include <mutex>
#include <openvr_driver.h>
#include <optional>
#include "ALVR-common/packet_types.h"

class PoseHistory
{
public:
	struct TrackingHistoryFrame {
		uint64_t targetTimestampNs;
		AlvrDeviceMotion motion;
		vr::HmdMatrix34_t rotationMatrix;
	};

	void OnPoseUpdated(uint64_t targetTimestampNs, AlvrDeviceMotion motion);

	std::optional<TrackingHistoryFrame> GetBestPoseMatch(const vr::HmdMatrix34_t &pose) const;
	// Return the most recent pose known at the given timestamp
	std::optional<TrackingHistoryFrame> GetPoseAt(uint64_t timestampNs) const;

private:
	mutable std::mutex m_mutex;
	std::list<TrackingHistoryFrame> m_poseBuffer;
};
