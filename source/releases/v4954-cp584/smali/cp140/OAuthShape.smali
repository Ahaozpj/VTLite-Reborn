.class public final Lcp140/OAuthShape;
.super Ljava/lang/Object;
.source "CP140OAuthShape.java"


# static fields
.field private static volatile flags:I

.field private static volatile hostCategory:Ljava/lang/String;

.field private static volatile keyCount:I

.field private static volatile priorCount:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, -0x1

    sput v0, Lcp140/OAuthShape;->flags:I

    sput v0, Lcp140/OAuthShape;->keyCount:I

    sput v0, Lcp140/OAuthShape;->priorCount:I

    const-string v0, "UNSEEN"

    sput-object v0, Lcp140/OAuthShape;->hostCategory:Ljava/lang/String;

    return-void
.end method

.method public static begin()V
    .registers 1

    const/4 v0, -0x1

    sput v0, Lcp140/OAuthShape;->flags:I

    sput v0, Lcp140/OAuthShape;->keyCount:I

    sput v0, Lcp140/OAuthShape;->priorCount:I

    const-string v0, "UNSEEN"

    sput-object v0, Lcp140/OAuthShape;->hostCategory:Ljava/lang/String;

    return-void
.end method

.method public static capture(Ljava/lang/String;)V
    .registers 6

    :try_start_0
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v3

    const-string v4, "oauth.vk.com"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_15

    const-string v4, "VK_COM"

    sput-object v4, Lcp140/OAuthShape;->hostCategory:Ljava/lang/String;

    goto :goto_26

    :cond_15
    const-string v4, "oauth.vk.ru"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_22

    const-string v4, "VK_RU"

    sput-object v4, Lcp140/OAuthShape;->hostCategory:Ljava/lang/String;

    goto :goto_26

    :cond_22
    const-string v4, "OTHER"

    sput-object v4, Lcp140/OAuthShape;->hostCategory:Ljava/lang/String;

    :goto_26
    invoke-virtual {v0}, Landroid/net/Uri;->getQueryParameterNames()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v4

    sput v4, Lcp140/OAuthShape;->keyCount:I

    const/4 v1, 0x0

    const-string v2, "device_id"

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3b

    or-int/lit8 v1, v1, 0x1

    :cond_3b
    const-string v2, "trusted_hash"

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_45

    or-int/lit8 v1, v1, 0x2

    :cond_45
    const-string v2, "libverify_support"

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4f

    or-int/lit8 v1, v1, 0x4

    :cond_4f
    const-string v2, "client_secret"

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_59

    or-int/lit8 v1, v1, 0x8

    :cond_59
    const-string v2, "scope"

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_63

    or-int/lit8 v1, v1, 0x10

    :cond_63
    const-string v2, "grant_type"

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6d

    or-int/lit8 v1, v1, 0x20

    :cond_6d
    sput v1, Lcp140/OAuthShape;->flags:I
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_6f} :catch_70

    goto :goto_7a

    :catch_70
    move-exception v0

    const/4 v1, -0x1

    sput v1, Lcp140/OAuthShape;->flags:I

    sput v1, Lcp140/OAuthShape;->keyCount:I

    const-string v1, "ERROR"

    sput-object v1, Lcp140/OAuthShape;->hostCategory:Ljava/lang/String;

    :goto_7a
    return-void
.end method

.method public static captureResponse(Lokhttp3/Response;)V
    .registers 4

    const/4 v0, 0x0

    :cond_1
    :try_start_1
    if-eqz p0, :cond_f

    invoke-virtual {p0}, Lokhttp3/Response;->l()Lokhttp3/Response;

    move-result-object p0

    if-eqz p0, :cond_f

    add-int/lit8 v0, v0, 0x1

    const/16 v1, 0x14

    if-lt v0, v1, :cond_1

    :cond_f
    sput v0, Lcp140/OAuthShape;->priorCount:I
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_11} :catch_12

    goto :goto_16

    :catch_12
    move-exception v1

    const/4 v0, -0x1

    sput v0, Lcp140/OAuthShape;->priorCount:I

    :goto_16
    return-void
.end method

.method public static summary()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CP140 MASK="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcp140/OAuthShape;->flags:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " KEYS="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcp140/OAuthShape;->keyCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " PRIOR="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lcp140/OAuthShape;->priorCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " HOST="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcp140/OAuthShape;->hostCategory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
