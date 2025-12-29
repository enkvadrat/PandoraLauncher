use bridge::message::SyncTarget;
use enumset::EnumSet;
use serde::{Deserialize, Serialize};

#[derive(Default, Serialize, Deserialize)]
pub struct BackendConfig {
    pub sync_targets: EnumSet<SyncTarget>,
}
