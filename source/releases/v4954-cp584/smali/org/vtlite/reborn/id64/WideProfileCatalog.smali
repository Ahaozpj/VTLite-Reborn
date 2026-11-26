.class public final Lorg/vtlite/reborn/id64/WideProfileCatalog;
.super Ljava/lang/Object;
.source "WideProfileCatalog.java"


# instance fields
.field private final groups:Ljava/util/HashMap;

.field private final status:I

.field private final users:Ljava/util/HashMap;


# direct methods
.method private constructor <init>(Ljava/util/HashMap;Ljava/util/HashMap;I)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/vtlite/reborn/id64/WideProfileCatalog;->users:Ljava/util/HashMap;

    iput-object p2, p0, Lorg/vtlite/reborn/id64/WideProfileCatalog;->groups:Ljava/util/HashMap;

    iput p3, p0, Lorg/vtlite/reborn/id64/WideProfileCatalog;->status:I

    return-void
.end method

.method public static capture(Lorg/json/JSONObject;)Lorg/vtlite/reborn/id64/WideProfileCatalog;
    .registers 16

    :try_start_0
    if-eqz p0, :cond_59

    const-string v0, "profiles"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-nez v1, :cond_10

    if-nez v2, :cond_59

    :cond_10
    const-string v0, "groups"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-nez v3, :cond_1e

    if-nez v4, :cond_59

    :cond_1e
    const/4 v6, 0x0

    if-eqz v1, :cond_25

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v6

    :cond_25
    const/4 v7, 0x0

    if-eqz v3, :cond_2c

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v7

    :cond_2c
    const/16 v9, 0x1000

    if-gt v6, v9, :cond_5f

    if-gt v7, v9, :cond_5f

    add-int v8, v6, v7

    if-gt v8, v9, :cond_5f

    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    const/4 v12, 0x0

    invoke-static {v1, v10, v12}, Lorg/vtlite/reborn/id64/WideProfileCatalog;->scan(Lorg/json/JSONArray;Ljava/util/HashMap;Z)I

    move-result v12

    and-int/lit8 v13, v12, 0xc

    if-nez v13, :cond_59

    const/4 v13, 0x1

    invoke-static {v3, v11, v13}, Lorg/vtlite/reborn/id64/WideProfileCatalog;->scan(Lorg/json/JSONArray;Ljava/util/HashMap;Z)I

    move-result v13

    and-int/lit8 v14, v13, 0xc

    if-nez v14, :cond_59

    or-int/2addr v12, v13

    new-instance v14, Lorg/vtlite/reborn/id64/WideProfileCatalog;

    invoke-direct {v14, v10, v11, v12}, Lorg/vtlite/reborn/id64/WideProfileCatalog;-><init>(Ljava/util/HashMap;Ljava/util/HashMap;I)V
    :try_end_58
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_58} :catch_66

    return-object v14

    :cond_59
    const/4 v0, 0x4

    invoke-static {v0}, Lorg/vtlite/reborn/id64/WideProfileCatalog;->failed(I)Lorg/vtlite/reborn/id64/WideProfileCatalog;

    move-result-object v0

    return-object v0

    :cond_5f
    const/16 v0, 0x8

    invoke-static {v0}, Lorg/vtlite/reborn/id64/WideProfileCatalog;->failed(I)Lorg/vtlite/reborn/id64/WideProfileCatalog;

    move-result-object v0

    return-object v0

    :catch_66
    move-exception v0

    const/4 v0, 0x4

    invoke-static {v0}, Lorg/vtlite/reborn/id64/WideProfileCatalog;->failed(I)Lorg/vtlite/reborn/id64/WideProfileCatalog;

    move-result-object v0

    return-object v0
.end method

.method private static failed(I)Lorg/vtlite/reborn/id64/WideProfileCatalog;
    .registers 5

    new-instance v0, Lorg/vtlite/reborn/id64/WideProfileCatalog;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-direct {v0, v1, v2, p0}, Lorg/vtlite/reborn/id64/WideProfileCatalog;-><init>(Ljava/util/HashMap;Ljava/util/HashMap;I)V

    return-object v0
.end method

.method private static find(Ljava/util/HashMap;J)I
    .registers 7

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_11

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    return v2

    :cond_11
    const/4 v2, -0x1

    return v2
.end method

.method private static scan(Lorg/json/JSONArray;Ljava/util/HashMap;Z)I
    .registers 16

    const/4 v0, 0x0

    if-eqz p0, :cond_60

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    const/16 v2, 0x1000

    if-gt v1, v2, :cond_63

    const/4 v3, 0x0

    :goto_c
    if-ge v3, v1, :cond_60

    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_61

    const-string v5, "id"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    instance-of v6, v5, Ljava/lang/Integer;

    if-nez v6, :cond_22

    instance-of v6, v5, Ljava/lang/Long;

    if-eqz v6, :cond_61

    :cond_22
    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v6, v7, v9

    if-lez v6, :cond_61

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {p1, v11}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_61

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {p1, v11, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_4b

    const-wide/32 v9, 0x7fffffff

    cmp-long v6, v7, v9

    if-lez v6, :cond_5d

    or-int/lit8 v0, v0, 0x10

    goto :goto_5d

    :cond_4b
    const-wide/32 v9, 0x77359400

    cmp-long v6, v7, v9

    if-ltz v6, :cond_54

    or-int/lit8 v0, v0, 0x1

    :cond_54
    const-wide/32 v9, 0x7fffffff

    cmp-long v6, v7, v9

    if-lez v6, :cond_5d

    or-int/lit8 v0, v0, 0x2

    :cond_5d
    :goto_5d
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    :cond_60
    return v0

    :cond_61
    const/4 v0, 0x4

    return v0

    :cond_63
    const/16 v0, 0x8

    return v0
.end method


# virtual methods
.method public flags()I
    .registers 2

    iget v0, p0, Lorg/vtlite/reborn/id64/WideProfileCatalog;->status:I

    return v0
.end method

.method public groupIndex(J)I
    .registers 5

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideProfileCatalog;->groups:Ljava/util/HashMap;

    invoke-static {v0, p1, p2}, Lorg/vtlite/reborn/id64/WideProfileCatalog;->find(Ljava/util/HashMap;J)I

    move-result v1

    return v1
.end method

.method public legacyStorageWriteAuthorized()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public userIndex(J)I
    .registers 5

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideProfileCatalog;->users:Ljava/util/HashMap;

    invoke-static {v0, p1, p2}, Lorg/vtlite/reborn/id64/WideProfileCatalog;->find(Ljava/util/HashMap;J)I

    move-result v1

    return v1
.end method

.method public v2StorageWriteAuthorized()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
