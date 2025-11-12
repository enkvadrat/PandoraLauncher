use bridge::handle::BackendHandle;
use gpui::Entity;

use crate::entity::{
    account::AccountEntries, instance::InstanceEntries, modrinth::FrontendModrinthData, version::VersionEntries,
};

pub mod account;
pub mod instance;
pub mod modrinth;
pub mod version;

#[derive(Clone)]
pub struct DataEntities {
    pub instances: Entity<InstanceEntries>,
    pub versions: Entity<VersionEntries>,
    pub modrinth: Entity<FrontendModrinthData>,
    pub accounts: Entity<AccountEntries>,
    pub backend_handle: BackendHandle,
}
