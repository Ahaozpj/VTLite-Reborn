.class public final Lorg/vtlite/reborn/id64/WideReferenceSnapshot;
.super Ljava/lang/Object;
.source "WideReferenceSnapshot.java"


# instance fields
.field private final kinds:Ljava/util/ArrayList;

.field private final peerIndices:Ljava/util/ArrayList;

.field private final peers:Ljava/util/ArrayList;

.field private final senderIndices:Ljava/util/ArrayList;

.field private final senders:Ljava/util/ArrayList;

.field private final status:I


# direct methods
.method private constructor <init>([Ljava/util/ArrayList;I)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    aget-object v1, p1, v0

    iput-object v1, p0, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->peers:Ljava/util/ArrayList;

    const/4 v0, 0x1

    aget-object v1, p1, v0

    iput-object v1, p0, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->senders:Ljava/util/ArrayList;

    const/4 v0, 0x2

    aget-object v1, p1, v0

    iput-object v1, p0, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->kinds:Ljava/util/ArrayList;

    const/4 v0, 0x3

    aget-object v1, p1, v0

    iput-object v1, p0, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->peerIndices:Ljava/util/ArrayList;

    const/4 v0, 0x4

    aget-object v1, p1, v0

    iput-object v1, p0, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->senderIndices:Ljava/util/ArrayList;

    iput p2, p0, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->status:I

    return-void
.end method

.method public static capture(Lorg/json/JSONObject;Lorg/vtlite/reborn/id64/WideProfileCatalog;)Lorg/vtlite/reborn/id64/WideReferenceSnapshot;
    .registers 26

    if-eqz p0, :cond_161

    if-eqz p1, :cond_161

    move-object/from16 v3, p1

    invoke-virtual {v3}, Lorg/vtlite/reborn/id64/WideProfileCatalog;->flags()I

    move-result v0

    and-int/lit8 v19, v0, 0xc

    if-nez v19, :cond_15c

    :try_start_e
    const-string v3, "items"

    move-object/from16 v11, p0

    invoke-virtual {v11, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_140

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/16 v3, 0x1000

    if-gt v2, v3, :cond_149

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v2}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v2}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, v2}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v9, 0x0

    :goto_3a
    if-ge v9, v2, :cond_11d

    invoke-virtual {v1, v9}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    if-eqz v10, :cond_140

    const-string v3, "conversation"

    invoke-virtual {v10, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    if-eqz v11, :cond_140

    const-string v3, "peer"

    invoke-virtual {v11, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    if-eqz v12, :cond_140

    const-string v3, "last_message"

    invoke-virtual {v10, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v13

    if-eqz v13, :cond_140

    const-string v3, "id"

    invoke-static {v12, v3}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->exactId(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v14

    if-eqz v14, :cond_140

    const-string v3, "from_id"

    invoke-static {v13, v3}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->exactId(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v15

    if-eqz v15, :cond_140

    invoke-virtual {v14}, Ljava/lang/Long;->longValue()J

    move-result-wide v20

    const-wide/16 v22, 0x0

    cmp-long v19, v20, v22

    if-eqz v19, :cond_140

    const-wide/32 v22, 0x7fffffff

    cmp-long v19, v20, v22

    if-lez v19, :cond_7d

    or-int/lit8 v0, v0, 0x20

    :cond_7d
    const-wide/32 v22, -0x80000000

    cmp-long v19, v20, v22

    if-ltz v19, :cond_85

    goto :goto_87

    :cond_85
    or-int/lit8 v0, v0, 0x20

    :goto_87
    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    move-result-wide v20

    const-wide/16 v22, 0x0

    cmp-long v19, v20, v22

    if-eqz v19, :cond_140

    const-wide/high16 v22, -0x8000000000000000L

    cmp-long v19, v20, v22

    if-eqz v19, :cond_140

    const-wide/32 v22, 0x7fffffff

    cmp-long v19, v20, v22

    if-lez v19, :cond_a0

    or-int/lit8 v0, v0, 0x40

    :cond_a0
    const-wide/32 v22, -0x80000000

    cmp-long v19, v20, v22

    if-ltz v19, :cond_a8

    goto :goto_aa

    :cond_a8
    or-int/lit8 v0, v0, 0x40

    :goto_aa
    invoke-static {v12}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->explicitPeerKind(Lorg/json/JSONObject;)I

    move-result v16

    const/16 v17, -0x1

    if-nez v16, :cond_b4

    or-int/lit16 v0, v0, 0x80

    :cond_b4
    invoke-virtual {v14}, Ljava/lang/Long;->longValue()J

    move-result-wide v20

    const-wide/16 v22, 0x0

    cmp-long v19, v20, v22

    if-lez v19, :cond_de

    const/4 v11, 0x1

    move/from16 v3, v16

    if-ne v3, v11, :cond_cc

    move-object/from16 v11, p1

    move-wide/from16 v12, v20

    invoke-virtual {v11, v12, v13}, Lorg/vtlite/reborn/id64/WideProfileCatalog;->userIndex(J)I

    move-result v17

    goto :goto_d9

    :cond_cc
    const/4 v11, 0x2

    move/from16 v3, v16

    if-ne v3, v11, :cond_de

    move-object/from16 v11, p1

    move-wide/from16 v12, v20

    invoke-virtual {v11, v12, v13}, Lorg/vtlite/reborn/id64/WideProfileCatalog;->groupIndex(J)I

    move-result v17

    :goto_d9
    if-ltz v17, :cond_dc

    goto :goto_de

    :cond_dc
    or-int/lit16 v0, v0, 0x100

    :cond_de
    :goto_de
    const/16 v18, -0x1

    invoke-virtual {v15}, Ljava/lang/Long;->longValue()J

    move-result-wide v20

    const-wide/16 v22, 0x0

    cmp-long v19, v20, v22

    if-lez v19, :cond_f2

    move-object/from16 v11, p1

    move-wide/from16 v12, v20

    invoke-virtual {v11, v12, v13}, Lorg/vtlite/reborn/id64/WideProfileCatalog;->userIndex(J)I

    move-result v18

    :cond_f2
    invoke-virtual {v4, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v5, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v3, v16

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v3, v19

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v3, v17

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v3, v19

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v3, v18

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v3, v19

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_3a

    :cond_11d
    const/4 v12, 0x5

    new-array v11, v12, [Ljava/util/ArrayList;

    move-object/from16 v19, v11

    const/16 v20, 0x0

    aput-object v4, v19, v20

    const/16 v20, 0x1

    aput-object v5, v19, v20

    const/16 v20, 0x2

    aput-object v6, v19, v20

    const/16 v20, 0x3

    aput-object v7, v19, v20

    const/16 v20, 0x4

    aput-object v8, v19, v20

    new-instance v21, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;

    move-object/from16 v11, v21

    move-object/from16 v12, v19

    invoke-direct {v11, v12, v0}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;-><init>([Ljava/util/ArrayList;I)V
    :try_end_13f
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_13f} :catch_152

    return-object v21

    :cond_140
    or-int/lit8 v19, v0, 0x4

    move/from16 v3, v19

    invoke-static {v3}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->failed(I)Lorg/vtlite/reborn/id64/WideReferenceSnapshot;

    move-result-object v19

    return-object v19

    :cond_149
    or-int/lit8 v19, v0, 0x8

    move/from16 v3, v19

    invoke-static {v3}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->failed(I)Lorg/vtlite/reborn/id64/WideReferenceSnapshot;

    move-result-object v19

    return-object v19

    :catch_152
    move-exception v19

    or-int/lit8 v19, v0, 0x4

    move/from16 v3, v19

    invoke-static {v3}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->failed(I)Lorg/vtlite/reborn/id64/WideReferenceSnapshot;

    move-result-object v19

    return-object v19

    :cond_15c
    invoke-static {v0}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->failed(I)Lorg/vtlite/reborn/id64/WideReferenceSnapshot;

    move-result-object v0

    return-object v0

    :cond_161
    const/4 v0, 0x4

    invoke-static {v0}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->failed(I)Lorg/vtlite/reborn/id64/WideReferenceSnapshot;

    move-result-object v0

    return-object v0
.end method

.method private static exactId(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;
    .registers 5

    if-eqz p0, :cond_19

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/lang/Integer;

    if-nez v1, :cond_e

    instance-of v1, v0, Ljava/lang/Long;

    if-eqz v1, :cond_19

    :cond_e
    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :cond_19
    const/4 v0, 0x0

    return-object v0
.end method

.method private static explicitPeerKind(Lorg/json/JSONObject;)I
    .registers 5

    const-string v0, "type"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_28

    const-string v0, "user"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    const/4 v0, 0x1

    return v0

    :cond_14
    const-string v0, "group"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    const/4 v0, 0x2

    return v0

    :cond_1e
    const-string v0, "chat"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_28

    const/4 v0, 0x3

    return v0

    :cond_28
    const/4 v0, 0x0

    return v0
.end method

.method private static failed(I)Lorg/vtlite/reborn/id64/WideReferenceSnapshot;
    .registers 7

    const/4 v0, 0x5

    new-array v1, v0, [Ljava/util/ArrayList;

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v0, :cond_10

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_10
    new-instance v4, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;

    invoke-direct {v4, v1, p0}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;-><init>([Ljava/util/ArrayList;I)V

    return-object v4
.end method

.method private static getIndex(Ljava/util/ArrayList;I)I
    .registers 4

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method private static getLong(Ljava/util/ArrayList;I)J
    .registers 5

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    return-wide v1
.end method


# virtual methods
.method public flags()I
    .registers 2

    iget v0, p0, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->status:I

    return v0
.end method

.method public legacyStorageWriteAuthorized()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public peerId(I)J
    .registers 5

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->peers:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->getLong(Ljava/util/ArrayList;I)J

    move-result-wide v1

    return-wide v1
.end method

.method public peerKind(I)I
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->kinds:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->getIndex(Ljava/util/ArrayList;I)I

    move-result v0

    return v0
.end method

.method public peerProfileIndex(I)I
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->peerIndices:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->getIndex(Ljava/util/ArrayList;I)I

    move-result v0

    return v0
.end method

.method public senderId(I)J
    .registers 5

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->senders:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->getLong(Ljava/util/ArrayList;I)J

    move-result-wide v1

    return-wide v1
.end method

.method public senderProfileIndex(I)I
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->senderIndices:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->getIndex(Ljava/util/ArrayList;I)I

    move-result v0

    return v0
.end method

.method public size()I
    .registers 2

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->peers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public v2StorageWriteAuthorized()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
