.class public final Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;
.super Ljava/lang/Object;
.source "WideDialogReadOnlyLane.java"


# instance fields
.field private final dates:Ljava/util/ArrayList;

.field private final messageIds:Ljava/util/ArrayList;

.field private final snapshot:Lorg/vtlite/reborn/id64/WideReferenceSnapshot;

.field private final status:I

.field private final unread:Ljava/util/ArrayList;


# direct methods
.method private constructor <init>(Lorg/vtlite/reborn/id64/WideReferenceSnapshot;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;I)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->snapshot:Lorg/vtlite/reborn/id64/WideReferenceSnapshot;

    iput-object p2, p0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->messageIds:Ljava/util/ArrayList;

    iput-object p3, p0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->dates:Ljava/util/ArrayList;

    iput-object p4, p0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->unread:Ljava/util/ArrayList;

    iput p5, p0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->status:I

    return-void
.end method

.method public static capture(Lorg/json/JSONObject;Lorg/vtlite/reborn/id64/WideReferenceSnapshot;)Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;
    .registers 28

    if-eqz p0, :cond_8c

    if-eqz p1, :cond_8c

    move-object/from16 v9, p1

    invoke-virtual {v9}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->flags()I

    move-result v0

    and-int/lit8 v15, v0, 0xc

    if-nez v15, :cond_8d

    :try_start_e
    move-object/from16 v9, p0

    const-string v10, "items"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_7e

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/16 v10, 0x1000

    if-gt v2, v10, :cond_81

    move-object/from16 v9, p1

    invoke-virtual {v9}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->size()I

    move-result v10

    if-ne v2, v10, :cond_7e

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v2}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v3, 0x0

    :goto_38
    if-ge v3, v2, :cond_72

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    if-eqz v7, :cond_7e

    const-string v10, "last_message"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    if-eqz v8, :cond_7e

    const-string v10, "conversation"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    if-eqz v9, :cond_7e

    const-string v10, "id"

    invoke-static {v8, v10}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->exactPositive(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v11

    if-eqz v11, :cond_7e

    const-string v10, "date"

    invoke-static {v8, v10}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->exactPositive(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v12

    if-eqz v12, :cond_7e

    invoke-static {v9}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->exactUnread(Lorg/json/JSONObject;)Ljava/lang/Integer;

    move-result-object v13

    if-eqz v13, :cond_7e

    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_38

    :cond_72
    new-instance v7, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

    move-object/from16 v8, p1

    move-object v9, v4

    move-object v10, v5

    move-object v11, v6

    move v12, v0

    invoke-direct/range {v7 .. v12}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;-><init>(Lorg/vtlite/reborn/id64/WideReferenceSnapshot;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;I)V
    :try_end_7d
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_7d} :catch_88

    return-object v7

    :cond_7e
    or-int/lit8 v0, v0, 0x4

    goto :goto_83

    :cond_81
    or-int/lit8 v0, v0, 0x8

    :goto_83
    invoke-static {v0}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->failed(I)Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

    move-result-object v1

    return-object v1

    :catch_88
    move-exception v1

    or-int/lit8 v0, v0, 0x4

    goto :goto_83

    :cond_8c
    const/4 v0, 0x4

    :cond_8d
    invoke-static {v0}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->failed(I)Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

    move-result-object v1

    return-object v1
.end method

.method private static exactPositive(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/Long;
    .registers 8

    if-eqz p0, :cond_1f

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/lang/Integer;

    if-nez v1, :cond_e

    instance-of v1, v0, Ljava/lang/Long;

    if-eqz v1, :cond_1f

    :cond_e
    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-lez v1, :cond_1f

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :cond_1f
    const/4 v0, 0x0

    return-object v0
.end method

.method private static exactUnread(Lorg/json/JSONObject;)Ljava/lang/Integer;
    .registers 5

    if-eqz p0, :cond_21

    const-string v0, "unread_count"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_10

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :cond_10
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_21

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ltz v1, :cond_21

    return-object v0

    :cond_21
    const/4 v0, 0x0

    return-object v0
.end method

.method private static failed(I)Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;
    .registers 7

    new-instance v0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

    const/4 v1, 0x0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move v5, p0

    invoke-direct/range {v0 .. v5}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;-><init>(Lorg/vtlite/reborn/id64/WideReferenceSnapshot;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;I)V

    return-object v0
.end method


# virtual methods
.method public displayAuthorized()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public flags()I
    .registers 2

    iget v0, p0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->status:I

    return v0
.end method

.method public lastDate(I)J
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->dates:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0
.end method

.method public legacyStorageWriteAuthorized()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public messageId(I)J
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->messageIds:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    return-wide p0
.end method

.method public peerId(I)J
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->snapshot:Lorg/vtlite/reborn/id64/WideReferenceSnapshot;

    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->peerId(I)J

    move-result-wide p0

    return-wide p0
.end method

.method public peerKind(I)I
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->snapshot:Lorg/vtlite/reborn/id64/WideReferenceSnapshot;

    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->peerKind(I)I

    move-result v0

    return v0
.end method

.method public peerProfileIndex(I)I
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->snapshot:Lorg/vtlite/reborn/id64/WideReferenceSnapshot;

    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->peerProfileIndex(I)I

    move-result v0

    return v0
.end method

.method public senderId(I)J
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->snapshot:Lorg/vtlite/reborn/id64/WideReferenceSnapshot;

    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/id64/WideReferenceSnapshot;->senderId(I)J

    move-result-wide p0

    return-wide p0
.end method

.method public size()I
    .registers 2

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->messageIds:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public unreadCount(I)I
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->unread:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public v2StorageWriteAuthorized()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
