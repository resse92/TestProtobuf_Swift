use thiserror::Error;

#[allow(dead_code)]
#[derive(Error, Debug)]
pub enum CacheError {
    #[error(transparent)]
    Db(#[from] sled::Error),
    #[error(transparent)]
    Protobuf(#[from] protos::ProtobufError),
}

pub type CacheResult<T> = Result<T, CacheError>;
