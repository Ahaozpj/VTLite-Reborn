.class public final Lorg/vtlite/reborn/security/CookieJarMigrationCore;
.super Ljava/lang/Object;
.source "CookieJarMigrationCore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;
    }
.end annotation


# static fields
.field private static final AAD:[B

.field private static final LOCK:Ljava/lang/Object;

.field private static final MAX_COOKIES:I = 0x1000

.field private static final MAX_KEY_BYTES:I = 0x800

.field private static final MAX_PLAIN_BYTES:I = 0x200000

.field private static final MAX_VALUE_BYTES:I = 0x8000

.field public static final PENDING:Ljava/lang/String; = "encrypted_cookie_jar_pending_v1"

.field private static final PREFIX:Ljava/lang/String; = "v1:"

.field public static final PRIMARY:Ljava/lang/String; = "encrypted_cookie_jar_v1"


# instance fields
.field private final cipher:Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;

.field private final legacy:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

.field private final secure:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 14
    const-string v0, "com.vtosters.reborn/cookie-jar/v1"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->AAD:[B

    .line 19
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->LOCK:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;)V
    .registers 4

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    iput-object p1, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->legacy:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    .line 32
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    iput-object p1, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->secure:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    .line 33
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;

    iput-object p1, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->cipher:Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;

    return-void
.end method

.method private cleanLegacy()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 110
    iget-object v0, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->legacy:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    invoke-interface {v0}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->clear()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    :cond_9
    new-instance v0, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string v1, "legacy cookie cleanup not durable"

    invoke-direct {v0, v1}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

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

    if-eqz p0, :cond_ac

    .line 151
    array-length v0, p0

    const/16 v1, 0x8

    if-lt v0, v1, :cond_ac

    array-length v0, p0

    const/high16 v1, 0x200000

    if-gt v0, v1, :cond_ac

    .line 152
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 153
    new-instance v1, Ljava/io/DataInputStream;

    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v1, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 154
    :try_start_1b
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result p0

    const v2, 0x43504a31

    if-ne p0, v2, :cond_9a

    .line 155
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result p0

    if-ltz p0, :cond_92

    const/16 v2, 0x1000

    if-gt p0, v2, :cond_92

    const/4 v2, 0x0

    :goto_2f
    if-ge v2, p0, :cond_80

    .line 157
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    const/4 v4, 0x1

    if-lt v3, v4, :cond_78

    const/16 v4, 0x800

    if-gt v3, v4, :cond_78

    .line 158
    new-array v3, v3, [B

    invoke-virtual {v1, v3}, Ljava/io/DataInputStream;->readFully([B)V

    .line 159
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    if-ltz v4, :cond_70

    const v5, 0x8000

    if-gt v4, v5, :cond_70

    .line 160
    new-array v4, v4, [B

    invoke-virtual {v1, v4}, Ljava/io/DataInputStream;->readFully([B)V

    .line 161
    new-instance v5, Ljava/lang/String;

    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v5, v3, v6}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 162
    new-instance v3, Ljava/lang/String;

    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v6}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-interface {v0, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_68

    add-int/lit8 v2, v2, 0x1

    goto :goto_2f

    :cond_68
    new-instance p0, Ljava/io/IOException;

    const-string v0, "duplicate cookie key"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 159
    :cond_70
    new-instance p0, Ljava/io/IOException;

    const-string v0, "cookie value length"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 157
    :cond_78
    new-instance p0, Ljava/io/IOException;

    const-string v0, "cookie key length"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 164
    :cond_80
    invoke-virtual {v1}, Ljava/io/DataInputStream;->available()I

    move-result p0
    :try_end_84
    .catchall {:try_start_1b .. :try_end_84} :catchall_a2

    if-nez p0, :cond_8a

    .line 165
    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V

    return-object v0

    .line 164
    :cond_8a
    :try_start_8a
    new-instance p0, Ljava/io/IOException;

    const-string v0, "cookie trailing bytes"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 155
    :cond_92
    new-instance p0, Ljava/io/IOException;

    const-string v0, "cookie count"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 154
    :cond_9a
    new-instance p0, Ljava/io/IOException;

    const-string v0, "cookie jar magic"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_a2
    .catchall {:try_start_8a .. :try_end_a2} :catchall_a2

    :catchall_a2
    move-exception p0

    .line 153
    :try_start_a3
    invoke-virtual {v1}, Ljava/io/DataInputStream;->close()V
    :try_end_a6
    .catchall {:try_start_a3 .. :try_end_a6} :catchall_a7

    goto :goto_ab

    :catchall_a7
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_ab
    throw p0

    .line 151
    :cond_ac
    new-instance p0, Ljava/io/IOException;

    const-string v0, "cookie jar length"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private decrypt(Ljava/lang/String;)Ljava/util/Map;
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
            Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;
        }
    .end annotation

    if-eqz p1, :cond_4a

    .line 116
    const-string v0, "v1:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4a

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/high16 v1, 0x600000

    if-gt v0, v1, :cond_4a

    .line 119
    :try_start_12
    invoke-static {}, Ljava/util/Base64;->getDecoder()Ljava/util/Base64$Decoder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/Base64$Decoder;->decode(Ljava/lang/String;)[B

    move-result-object p1

    .line 120
    iget-object v0, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->cipher:Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;

    sget-object v1, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->AAD:[B

    invoke-interface {v0, p1, v1}, Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;->decrypt([B[B)[B

    move-result-object p1
    :try_end_27
    .catch Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure; {:try_start_12 .. :try_end_27} :catch_48
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_27} :catch_40

    const/4 v0, 0x0

    .line 121
    :try_start_28
    invoke-static {p1}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->decode([B)Ljava/util/Map;

    move-result-object v1

    invoke-static {v1}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->validate(Ljava/util/Map;)V

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1
    :try_end_33
    .catchall {:try_start_28 .. :try_end_33} :catchall_39

    if-eqz p1, :cond_38

    .line 122
    :try_start_35
    invoke-static {p1, v0}, Ljava/util/Arrays;->fill([BB)V

    :cond_38
    return-object v1

    :catchall_39
    move-exception v1

    if-eqz p1, :cond_3f

    invoke-static {p1, v0}, Ljava/util/Arrays;->fill([BB)V

    :cond_3f
    throw v1
    :try_end_40
    .catch Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure; {:try_start_35 .. :try_end_40} :catch_48
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_40} :catch_40

    .line 124
    :catch_40
    new-instance p1, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string v0, "cookie ciphertext cannot be verified"

    invoke-direct {p1, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1

    :catch_48
    move-exception p1

    .line 123
    throw p1

    .line 117
    :cond_4a
    new-instance p1, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string v0, "invalid cookie secure format"

    invoke-direct {p1, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

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

    .line 139
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 140
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    const v2, 0x43504a31

    .line 141
    :try_start_d
    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 142
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

    .line 143
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v3

    .line 144
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    .line 145
    array-length v4, v3

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->write([B)V

    array-length v3, v2

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->write([B)V
    :try_end_51
    .catchall {:try_start_d .. :try_end_51} :catchall_5a

    goto :goto_1f

    .line 147
    :cond_52
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V

    .line 148
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0

    :catchall_5a
    move-exception p0

    .line 140
    :try_start_5b
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V
    :try_end_5e
    .catchall {:try_start_5b .. :try_end_5e} :catchall_5f

    goto :goto_63

    :catchall_5f
    move-exception v0

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_63
    throw p0
.end method

.method private erasePending()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 113
    iget-object v0, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->secure:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    const-string v1, "encrypted_cookie_jar_pending_v1"

    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->remove(Ljava/util/Set;)Z

    move-result v0

    if-eqz v0, :cond_f

    return-void

    :cond_f
    new-instance v0, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string v1, "cookie stage cleanup not durable"

    invoke-direct {v0, v1}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private loadLocked()Ljava/util/Map;
    .registers 4
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
            Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 63
    iget-object v0, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->secure:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    invoke-interface {v0}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->readAll()Ljava/util/Map;

    move-result-object v0

    .line 64
    const-string v1, "encrypted_cookie_jar_pending_v1"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 65
    const-string v2, "encrypted_cookie_jar_v1"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v1, :cond_35

    .line 68
    :try_start_18
    invoke-direct {p0, v1}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->decrypt(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0
    :try_end_1c
    .catch Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure; {:try_start_18 .. :try_end_1c} :catch_26

    .line 73
    invoke-direct {p0, v1, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->promote(Ljava/lang/String;Ljava/util/Map;)V

    .line 74
    invoke-direct {p0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->cleanLegacy()V

    invoke-direct {p0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->erasePending()V

    return-object v0

    :catch_26
    move-exception v1

    if-eqz v0, :cond_34

    .line 70
    invoke-direct {p0, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->decrypt(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 71
    invoke-direct {p0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->erasePending()V

    invoke-direct {p0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->cleanLegacy()V

    return-object v0

    .line 69
    :cond_34
    throw v1

    :cond_35
    if-eqz v0, :cond_3f

    .line 77
    invoke-direct {p0, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->decrypt(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 78
    invoke-direct {p0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->cleanLegacy()V

    return-object v0

    .line 80
    :cond_3f
    new-instance v0, Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->legacy:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    invoke-interface {v1}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->readAll()Ljava/util/Map;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 81
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_55

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    return-object v0

    .line 82
    :cond_55
    invoke-static {v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->validate(Ljava/util/Map;)V

    .line 83
    invoke-direct {p0, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->persist(Ljava/util/Map;)V

    .line 84
    invoke-direct {p0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->cleanLegacy()V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method private persist(Ljava/util/Map;)V
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
            Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;
        }
    .end annotation

    const-string v0, "v1:"

    .line 87
    invoke-static {p1}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->validate(Ljava/util/Map;)V

    .line 90
    :try_start_5
    invoke-static {p1}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->encode(Ljava/util/Map;)[B

    move-result-object v1
    :try_end_9
    .catch Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure; {:try_start_5 .. :try_end_9} :catch_82
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_9} :catch_7a

    const/4 v2, 0x0

    .line 92
    :try_start_a
    iget-object v3, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->cipher:Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;

    sget-object v4, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->AAD:[B

    invoke-interface {v3, v1, v4}, Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;->encrypt([B[B)[B

    move-result-object v3
    :try_end_12
    .catchall {:try_start_a .. :try_end_12} :catchall_75

    :try_start_12
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    if-eqz v3, :cond_6d

    .line 93
    array-length v1, v3

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_6d

    array-length v1, v3

    const v2, 0x200080

    if-gt v1, v2, :cond_6d

    .line 95
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/util/Base64;->getEncoder()Ljava/util/Base64$Encoder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/util/Base64$Encoder;->encodeToString([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_36
    .catch Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure; {:try_start_12 .. :try_end_36} :catch_82
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_36} :catch_7a

    .line 98
    iget-object v1, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->secure:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    const-string v2, "encrypted_cookie_jar_pending_v1"

    invoke-interface {v1, v2, v0}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->put(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_65

    .line 99
    iget-object v1, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->secure:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    invoke-interface {v1}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->readAll()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->decrypt(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5d

    .line 101
    invoke-direct {p0, v0, p1}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->promote(Ljava/lang/String;Ljava/util/Map;)V

    .line 102
    invoke-direct {p0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->erasePending()V

    return-void

    .line 100
    :cond_5d
    new-instance p1, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string v0, "cookie stage mismatch"

    invoke-direct {p1, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1

    .line 98
    :cond_65
    new-instance p1, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string v0, "cookie stage write not durable"

    invoke-direct {p1, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1

    .line 94
    :cond_6d
    :try_start_6d
    new-instance p1, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string v0, "cookie encryption envelope invalid"

    invoke-direct {p1, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_75
    move-exception p1

    .line 92
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([BB)V

    throw p1
    :try_end_7a
    .catch Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure; {:try_start_6d .. :try_end_7a} :catch_82
    .catch Ljava/lang/Exception; {:try_start_6d .. :try_end_7a} :catch_7a

    .line 97
    :catch_7a
    new-instance p1, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string v0, "cookie encryption failed"

    invoke-direct {p1, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1

    :catch_82
    move-exception p1

    .line 96
    throw p1
.end method

.method private promote(Ljava/lang/String;Ljava/util/Map;)V
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
            Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 105
    iget-object v0, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->secure:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    const-string v1, "encrypted_cookie_jar_v1"

    invoke-interface {v0, v1, p1}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->put(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_29

    .line 106
    iget-object p1, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->secure:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    invoke-interface {p1}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->readAll()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-direct {p0, p1}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->decrypt(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1, p2}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_21

    return-void

    .line 107
    :cond_21
    new-instance p1, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string p2, "cookie promotion mismatch"

    invoke-direct {p1, p2}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1

    .line 105
    :cond_29
    new-instance p1, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string p2, "cookie promotion not durable"

    invoke-direct {p1, p2}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static validate(Ljava/util/Map;)V
    .registers 10
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
            Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 127
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v0

    const/16 v1, 0x1000

    if-gt v0, v1, :cond_77

    .line 129
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const-wide/16 v0, 0x8

    move-wide v2, v0

    :goto_13
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_76

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 130
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_6e

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_6e

    .line 131
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v5, v6}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v5

    array-length v5, v5

    .line 132
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    sget-object v6, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v6}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    array-length v4, v4

    const/4 v6, 0x1

    if-lt v5, v6, :cond_66

    const/16 v6, 0x800

    if-gt v5, v6, :cond_66

    const v6, 0x8000

    if-gt v4, v6, :cond_66

    int-to-long v5, v5

    add-long/2addr v5, v0

    int-to-long v7, v4

    add-long/2addr v5, v7

    add-long/2addr v2, v5

    const-wide/32 v4, 0x200000

    cmp-long v4, v2, v4

    if-gtz v4, :cond_5e

    goto :goto_13

    .line 135
    :cond_5e
    new-instance p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string v0, "cookie jar size limit"

    invoke-direct {p0, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p0

    .line 133
    :cond_66
    new-instance p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string v0, "cookie entry out of bounds"

    invoke-direct {p0, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p0

    .line 130
    :cond_6e
    new-instance p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string v0, "null cookie entry"

    invoke-direct {p0, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_76
    return-void

    .line 127
    :cond_77
    new-instance p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string v0, "too many cookies"

    invoke-direct {p0, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public clear()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 55
    sget-object v0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 57
    :try_start_3
    iget-object v1, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->legacy:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    invoke-interface {v1}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->clear()Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 58
    iget-object v1, p0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->secure:Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;

    new-instance v2, Ljava/util/LinkedHashSet;

    const-string v3, "encrypted_cookie_jar_v1"

    const-string v4, "encrypted_cookie_jar_pending_v1"

    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v1, v2}, Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;->remove(Ljava/util/Set;)Z

    move-result v1

    if-eqz v1, :cond_26

    .line 60
    monitor-exit v0

    return-void

    .line 59
    :cond_26
    new-instance v1, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string v2, "secure cookie erase not durable"

    invoke-direct {v1, v2}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw v1

    .line 57
    :cond_2e
    new-instance v1, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;

    const-string v2, "legacy cookie erase not durable"

    invoke-direct {v1, v2}, Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_36
    move-exception v1

    .line 60
    monitor-exit v0
    :try_end_38
    .catchall {:try_start_3 .. :try_end_38} :catchall_36

    throw v1
.end method

.method public load()Ljava/util/Map;
    .registers 3
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
            Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 36
    sget-object v0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-direct {p0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->loadLocked()Ljava/util/Map;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_9
    move-exception v1

    monitor-exit v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_9

    throw v1
.end method

.method public merge(Ljava/util/Map;)V
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
            Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 39
    sget-object v0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 40
    :try_start_3
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {p0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->loadLocked()Ljava/util/Map;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    if-eqz p1, :cond_11

    .line 41
    invoke-interface {v1, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 42
    :cond_11
    invoke-direct {p0, v1}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->persist(Ljava/util/Map;)V

    .line 43
    invoke-direct {p0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->cleanLegacy()V

    .line 44
    monitor-exit v0

    return-void

    :catchall_19
    move-exception p1

    monitor-exit v0
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_19

    throw p1
.end method

.method public remove(Ljava/util/Collection;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 47
    sget-object v0, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 48
    :try_start_3
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {p0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->loadLocked()Ljava/util/Map;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    if-eqz p1, :cond_22

    .line 49
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_12
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12

    .line 50
    :cond_22
    invoke-direct {p0, v1}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->persist(Ljava/util/Map;)V

    .line 51
    invoke-direct {p0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->cleanLegacy()V

    .line 52
    monitor-exit v0

    return-void

    :catchall_2a
    move-exception p1

    monitor-exit v0
    :try_end_2c
    .catchall {:try_start_3 .. :try_end_2c} :catchall_2a

    throw p1
.end method
