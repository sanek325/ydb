PROTO_LIBRARY()

EXCLUDE_TAGS(GO_PROTO)

GRPC()
SRCS(
    symmetric_crypto_service.proto
    symmetric_key.proto
)

PEERDIR(
    ydb/public/api/client/yc_private/kms/asymmetricencryption
    ydb/public/api/client/yc_private/kms/asymmetricsignature
)

END()

