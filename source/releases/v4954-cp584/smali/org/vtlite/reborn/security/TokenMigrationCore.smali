.class public final Lorg/vtlite/reborn/security/TokenMigrationCore;
.super Ljava/lang/Object;
.source "TokenMigrationCore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;,
        Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;,
        Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;
    }
.end annotation


# static fields
.field private static final AAD:[B

.field public static final CIPHERTEXT_KEY:Ljava/lang/String; = "encrypted_sdk_token_v1"

.field public static final FIELDS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAX_PLAINTEXT_BYTES:I = 0x8000

.field private static final MAX_VALUE_BYTES:I = 0x4000

.field public static final PENDING_KEY:Ljava/lang/String; = "encrypted_sdk_token_pending_v1"

.field private static final PROCESS_LOCK:Ljava/lang/Object;

.field private static final VERSION:Ljava/lang/String; = "v1:"


# instance fields
.field private final crypto:Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;

.field private final legacy:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

.field private final protectedPrefs:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .line 26
    const-string v0, "com.vtosters.reborn/sdk-token/v1"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lorg/vtlite/reborn/security/TokenMigrationCore;->AAD:[B

    .line 27
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/vtlite/reborn/security/TokenMigrationCore;->PROCESS_LOCK:Ljava/lang/Object;

    .line 28
    new-instance v0, Ljava/util/LinkedHashSet;

    const-string v8, "phone"

    const-string v9, "phone_access_key"

    const-string v1, "access_token"

    const-string v2, "secret"

    const-string v3, "user_id"

    const-string v4, "https_required"

    const-string v5, "created"

    const-string v6, "expires_in"

    const-string v7, "email"

    filled-new-array/range {v1 .. v9}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lorg/vtlite/reborn/security/TokenMigrationCore;->FIELDS:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;)V
    .registers 4

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    iput-object p1, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->legacy:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    .line 37
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    iput-object p1, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->protectedPrefs:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    .line 38
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;

    iput-object p1, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->crypto:Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;

    return-void
.end method

.method private cleanLegacyOrThrow()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 167
    iget-object v0, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->legacy:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    sget-object v1, Lorg/vtlite/reborn/security/TokenMigrationCore;->FIELDS:Ljava/util/Set;

    invoke-interface {v0, v1}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->remove(Ljava/util/Set;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    new-instance v0, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string v1, "legacy token cleanup failed"

    invoke-direct {v0, v1}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static decode([B)Ljava/util/Map;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p0, :cond_bc

    .line 185
    array-length v0, p0

    const/16 v1, 0x8

    if-lt v0, v1, :cond_bc

    array-length v0, p0

    const v1, 0x8000

    if-gt v0, v1, :cond_bc

    .line 186
    new-instance v0, Ljava/io/DataInputStream;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 187
    :try_start_17
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result p0

    const v1, 0x56544c31

    if-ne p0, v1, :cond_aa

    .line 188
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result p0

    const/4 v1, 0x2

    if-lt p0, v1, :cond_a2

    sget-object v1, Lorg/vtlite/reborn/security/TokenMigrationCore;->FIELDS:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    if-gt p0, v1, :cond_a2

    .line 189
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    const/4 v2, 0x0

    :goto_35
    if-ge v2, p0, :cond_90

    .line 191
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    const/4 v4, 0x1

    if-lt v3, v4, :cond_88

    const/16 v4, 0x80

    if-gt v3, v4, :cond_88

    .line 192
    new-array v3, v3, [B

    invoke-virtual {v0, v3}, Ljava/io/DataInputStream;->readFully([B)V

    .line 193
    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    if-ltz v4, :cond_80

    const/16 v5, 0x4000

    if-gt v4, v5, :cond_80

    .line 194
    new-array v4, v4, [B

    invoke-virtual {v0, v4}, Ljava/io/DataInputStream;->readFully([B)V

    .line 195
    new-instance v5, Ljava/lang/String;

    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v5, v3, v6}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 196
    sget-object v3, Lorg/vtlite/reborn/security/TokenMigrationCore;->FIELDS:Ljava/util/Set;

    invoke-interface {v3, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_78

    invoke-interface {v1, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_78

    .line 197
    new-instance v3, Ljava/lang/String;

    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v6}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-interface {v1, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_35

    .line 196
    :cond_78
    new-instance p0, Ljava/io/IOException;

    const-string v1, "invalid token key"

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 193
    :cond_80
    new-instance p0, Ljava/io/IOException;

    const-string v1, "invalid value length"

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 191
    :cond_88
    new-instance p0, Ljava/io/IOException;

    const-string v1, "invalid key length"

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 199
    :cond_90
    invoke-virtual {v0}, Ljava/io/DataInputStream;->available()I

    move-result p0
    :try_end_94
    .catchall {:try_start_17 .. :try_end_94} :catchall_b2

    if-nez p0, :cond_9a

    .line 201
    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V

    return-object v1

    .line 199
    :cond_9a
    :try_start_9a
    new-instance p0, Ljava/io/IOException;

    const-string v1, "trailing token bytes"

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 188
    :cond_a2
    new-instance p0, Ljava/io/IOException;

    const-string v1, "invalid field count"

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 187
    :cond_aa
    new-instance p0, Ljava/io/IOException;

    const-string v1, "wrong token format"

    invoke-direct {p0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_b2
    .catchall {:try_start_9a .. :try_end_b2} :catchall_b2

    :catchall_b2
    move-exception p0

    .line 186
    :try_start_b3
    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V
    :try_end_b6
    .catchall {:try_start_b3 .. :try_end_b6} :catchall_b7

    goto :goto_bb

    :catchall_b7
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_bb
    throw p0

    .line 185
    :cond_bc
    new-instance p0, Ljava/io/IOException;

    const-string v0, "invalid token length"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private decodeEncrypted(Ljava/lang/String;)Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;
        }
    .end annotation

    if-eqz p1, :cond_4b

    .line 134
    const-string v0, "v1:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4b

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const v1, 0x18000

    if-gt v0, v1, :cond_4b

    .line 137
    :try_start_13
    invoke-static {}, Ljava/util/Base64;->getDecoder()Ljava/util/Base64$Decoder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/Base64$Decoder;->decode(Ljava/lang/String;)[B

    move-result-object p1

    .line 138
    iget-object v0, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->crypto:Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;

    sget-object v1, Lorg/vtlite/reborn/security/TokenMigrationCore;->AAD:[B

    invoke-interface {v0, p1, v1}, Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;->decrypt([B[B)[B

    move-result-object p1
    :try_end_28
    .catch Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure; {:try_start_13 .. :try_end_28} :catch_49
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_28} :catch_41

    const/4 v0, 0x0

    .line 140
    :try_start_29
    invoke-static {p1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->decode([B)Ljava/util/Map;

    move-result-object v1

    .line 141
    invoke-static {v1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->validate(Ljava/util/Map;)V

    .line 142
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1
    :try_end_34
    .catchall {:try_start_29 .. :try_end_34} :catchall_3a

    if-eqz p1, :cond_39

    .line 143
    :try_start_36
    invoke-static {p1, v0}, Ljava/util/Arrays;->fill([BB)V

    :cond_39
    return-object v1

    :catchall_3a
    move-exception v1

    if-eqz p1, :cond_40

    invoke-static {p1, v0}, Ljava/util/Arrays;->fill([BB)V

    :cond_40
    throw v1
    :try_end_41
    .catch Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure; {:try_start_36 .. :try_end_41} :catch_49
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_41} :catch_41

    .line 145
    :catch_41
    new-instance p1, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string v0, "secure token cannot be decrypted"

    invoke-direct {p1, v0}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1

    :catch_49
    move-exception p1

    .line 144
    throw p1

    .line 135
    :cond_4b
    new-instance p1, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string v0, "secure token format invalid"

    invoke-direct {p1, v0}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static encode(Ljava/util/Map;)[B
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)[B"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 171
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 172
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    const v2, 0x56544c31

    .line 173
    :try_start_d
    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 174
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1f
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_52

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 175
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    .line 176
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    .line 177
    array-length v4, v3

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->write([B)V

    array-length v3, v2

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->write([B)V
    :try_end_51
    .catchall {:try_start_d .. :try_end_51} :catchall_6b

    goto :goto_1f

    .line 179
    :cond_52
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V

    .line 180
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result p0

    const v1, 0x8000

    if-gt p0, v1, :cond_63

    .line 181
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0

    .line 180
    :cond_63
    new-instance p0, Ljava/io/IOException;

    const-string v0, "token too large"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_6b
    move-exception p0

    .line 172
    :try_start_6c
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V
    :try_end_6f
    .catchall {:try_start_6c .. :try_end_6f} :catchall_70

    goto :goto_74

    :catchall_70
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_74
    throw p0
.end method

.method private erasePendingOrThrow()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 129
    iget-object v0, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->protectedPrefs:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    const-string v1, "encrypted_sdk_token_pending_v1"

    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->remove(Ljava/util/Set;)Z

    move-result v0

    if-eqz v0, :cond_f

    return-void

    .line 130
    :cond_f
    new-instance v0, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string v1, "staged token cleanup not durable"

    invoke-direct {v0, v1}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private persistInTwoPhases(Ljava/util/Map;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;
        }
    .end annotation

    const-string v0, "v1:"

    .line 106
    :try_start_2
    invoke-static {p1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->encode(Ljava/util/Map;)[B

    move-result-object v1
    :try_end_6
    .catch Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure; {:try_start_2 .. :try_end_6} :catch_7c
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_6} :catch_74

    const/4 v2, 0x0

    .line 108
    :try_start_7
    iget-object v3, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->crypto:Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;

    sget-object v4, Lorg/vtlite/reborn/security/TokenMigrationCore;->AAD:[B

    invoke-interface {v3, v1, v4}, Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;->encrypt([B[B)[B

    move-result-object v3
    :try_end_f
    .catchall {:try_start_7 .. :try_end_f} :catchall_6f

    .line 109
    :try_start_f
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    if-eqz v3, :cond_67

    .line 110
    array-length v1, v3

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_67

    array-length v1, v3

    const v2, 0x8080

    if-gt v1, v2, :cond_67

    .line 112
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_33
    .catch Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure; {:try_start_f .. :try_end_33} :catch_7c
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_33} :catch_74

    .line 116
    iget-object v1, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->protectedPrefs:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    const-string v2, "encrypted_sdk_token_pending_v1"

    invoke-interface {v1, v2, v0}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->put(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5f

    .line 117
    iget-object v1, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->protectedPrefs:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    invoke-interface {v1}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->readAll()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->decodeEncrypted(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    .line 118
    invoke-interface {v1, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_57

    .line 119
    invoke-direct {p0, v0, p1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->promoteAndVerify(Ljava/lang/String;Ljava/util/Map;)V

    return-void

    .line 118
    :cond_57
    new-instance p1, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string v0, "staged token readback mismatch"

    invoke-direct {p1, v0}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1

    .line 116
    :cond_5f
    new-instance p1, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string v0, "staged token write not durable"

    invoke-direct {p1, v0}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1

    .line 111
    :cond_67
    :try_start_67
    new-instance p1, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string v0, "encryption output invalid"

    invoke-direct {p1, v0}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_6f
    move-exception p1

    .line 109
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    throw p1
    :try_end_74
    .catch Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure; {:try_start_67 .. :try_end_74} :catch_7c
    .catch Ljava/lang/Exception; {:try_start_67 .. :try_end_74} :catch_74

    .line 114
    :catch_74
    new-instance p1, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string v0, "secure token encryption failed"

    invoke-direct {p1, v0}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1

    :catch_7c
    move-exception p1

    .line 113
    throw p1
.end method

.method private promoteAndVerify(Ljava/lang/String;Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 123
    iget-object v0, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->protectedPrefs:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    const-string v1, "encrypted_sdk_token_v1"

    invoke-interface {v0, v1, p1}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->put(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_29

    .line 124
    iget-object p1, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->protectedPrefs:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    invoke-interface {p1}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->readAll()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-direct {p0, p1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->decodeEncrypted(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    .line 125
    invoke-interface {p1, p2}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_21

    return-void

    :cond_21
    new-instance p1, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string p2, "secure token promotion mismatch"

    invoke-direct {p1, p2}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1

    .line 123
    :cond_29
    new-instance p1, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string p2, "secure token promotion not durable"

    invoke-direct {p1, p2}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static selectLegacy(Ljava/util/Map;)Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 149
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 150
    sget-object v1, Lorg/vtlite/reborn/security/TokenMigrationCore;->FIELDS:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_b
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {p0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_b

    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b

    :cond_2d
    return-object v0
.end method

.method private static validate(Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 155
    const-string v0, "access_token"

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_80

    const-string v1, "user_id"

    invoke-interface {p0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_80

    .line 156
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_80

    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_80

    .line 158
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v0

    sget-object v2, Lorg/vtlite/reborn/security/TokenMigrationCore;->FIELDS:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v3

    if-gt v0, v3, :cond_78

    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_78

    .line 160
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_46
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_66

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    array-length v2, v2

    const/16 v3, 0x4000

    if-gt v2, v3, :cond_5e

    goto :goto_46

    .line 161
    :cond_5e
    new-instance p0, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string v0, "token field exceeds bound"

    invoke-direct {p0, v0}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p0

    .line 162
    :cond_66
    :try_start_66
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_6f
    .catch Ljava/lang/NumberFormatException; {:try_start_66 .. :try_end_6f} :catch_70

    return-void

    .line 163
    :catch_70
    new-instance p0, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string v0, "token user id invalid"

    invoke-direct {p0, v0}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p0

    .line 159
    :cond_78
    new-instance p0, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string v0, "token unexpected fields"

    invoke-direct {p0, v0}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p0

    .line 157
    :cond_80
    new-instance p0, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string v0, "token missing required fields"

    invoke-direct {p0, v0}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public logout()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 96
    sget-object v0, Lorg/vtlite/reborn/security/TokenMigrationCore;->PROCESS_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 97
    :try_start_3
    iget-object v1, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->legacy:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    invoke-interface {v1}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->clear()Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 98
    iget-object v1, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->protectedPrefs:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    new-instance v2, Ljava/util/LinkedHashSet;

    const-string v3, "encrypted_sdk_token_v1"

    const-string v4, "encrypted_sdk_token_pending_v1"

    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v1, v2}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->remove(Ljava/util/Set;)Z

    move-result v1

    if-eqz v1, :cond_26

    .line 100
    monitor-exit v0

    return-void

    .line 99
    :cond_26
    new-instance v1, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string v2, "secure token erase not durable"

    invoke-direct {v1, v2}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw v1

    .line 97
    :cond_2e
    new-instance v1, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;

    const-string v2, "legacy token logout cleanup failed"

    invoke-direct {v1, v2}, Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_36
    move-exception v1

    .line 100
    monitor-exit v0
    :try_end_38
    .catchall {:try_start_3 .. :try_end_38} :catchall_36

    throw v1
.end method

.method public readOrMigrate()Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 45
    sget-object v0, Lorg/vtlite/reborn/security/TokenMigrationCore;->PROCESS_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 46
    :try_start_3
    iget-object v1, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->protectedPrefs:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    invoke-interface {v1}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->readAll()Ljava/util/Map;

    move-result-object v1

    .line 47
    const-string v2, "encrypted_sdk_token_pending_v1"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 48
    const-string v3, "encrypted_sdk_token_v1"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_19
    .catchall {:try_start_3 .. :try_end_19} :catchall_6a

    if-eqz v2, :cond_3a

    .line 51
    :try_start_1b
    invoke-direct {p0, v2}, Lorg/vtlite/reborn/security/TokenMigrationCore;->decodeEncrypted(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1
    :try_end_1f
    .catch Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure; {:try_start_1b .. :try_end_1f} :catch_2a
    .catchall {:try_start_1b .. :try_end_1f} :catchall_6a

    .line 61
    :try_start_1f
    invoke-direct {p0, v2, v1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->promoteAndVerify(Ljava/lang/String;Ljava/util/Map;)V

    .line 62
    invoke-direct {p0}, Lorg/vtlite/reborn/security/TokenMigrationCore;->cleanLegacyOrThrow()V

    .line 63
    invoke-direct {p0}, Lorg/vtlite/reborn/security/TokenMigrationCore;->erasePendingOrThrow()V

    .line 64
    monitor-exit v0

    return-object v1

    :catch_2a
    move-exception v2

    if-eqz v1, :cond_39

    .line 56
    invoke-direct {p0, v1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->decodeEncrypted(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    .line 57
    invoke-direct {p0}, Lorg/vtlite/reborn/security/TokenMigrationCore;->erasePendingOrThrow()V

    .line 58
    invoke-direct {p0}, Lorg/vtlite/reborn/security/TokenMigrationCore;->cleanLegacyOrThrow()V

    .line 59
    monitor-exit v0

    return-object v1

    .line 55
    :cond_39
    throw v2

    :cond_3a
    if-eqz v1, :cond_45

    .line 67
    invoke-direct {p0, v1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->decodeEncrypted(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    .line 68
    invoke-direct {p0}, Lorg/vtlite/reborn/security/TokenMigrationCore;->cleanLegacyOrThrow()V

    .line 69
    monitor-exit v0

    return-object v1

    .line 71
    :cond_45
    iget-object v1, p0, Lorg/vtlite/reborn/security/TokenMigrationCore;->legacy:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    invoke-interface {v1}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->readAll()Ljava/util/Map;

    move-result-object v1

    invoke-static {v1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->selectLegacy(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    .line 72
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_58

    monitor-exit v0

    const/4 v0, 0x0

    return-object v0

    .line 73
    :cond_58
    invoke-static {v1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->validate(Ljava/util/Map;)V

    .line 74
    invoke-direct {p0, v1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->persistInTwoPhases(Ljava/util/Map;)V

    .line 75
    invoke-direct {p0}, Lorg/vtlite/reborn/security/TokenMigrationCore;->cleanLegacyOrThrow()V

    .line 76
    invoke-direct {p0}, Lorg/vtlite/reborn/security/TokenMigrationCore;->erasePendingOrThrow()V

    .line 77
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_6a
    move-exception v1

    .line 78
    monitor-exit v0
    :try_end_6c
    .catchall {:try_start_1f .. :try_end_6c} :catchall_6a

    throw v1
.end method

.method public saveNew(Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 85
    sget-object v0, Lorg/vtlite/reborn/security/TokenMigrationCore;->PROCESS_LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 86
    :try_start_3
    invoke-static {p1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->selectLegacy(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    .line 87
    invoke-static {p1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->validate(Ljava/util/Map;)V

    .line 88
    invoke-direct {p0, p1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->persistInTwoPhases(Ljava/util/Map;)V

    .line 89
    invoke-direct {p0}, Lorg/vtlite/reborn/security/TokenMigrationCore;->cleanLegacyOrThrow()V

    .line 90
    invoke-direct {p0}, Lorg/vtlite/reborn/security/TokenMigrationCore;->erasePendingOrThrow()V

    .line 91
    monitor-exit v0

    return-void

    :catchall_15
    move-exception p1

    monitor-exit v0
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_15

    throw p1
.end method
