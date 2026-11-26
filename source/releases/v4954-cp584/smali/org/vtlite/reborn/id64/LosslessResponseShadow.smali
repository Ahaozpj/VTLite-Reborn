.class public final Lorg/vtlite/reborn/id64/LosslessResponseShadow;
.super Ljava/lang/Object;
.source "LosslessResponseShadow.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;,
        Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;,
        Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;,
        Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;,
        Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;,
        Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;,
        Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;
    }
.end annotation


# static fields
.field private static final LEGACY_USER_UPPER_EXCLUSIVE:J = 0x77359400L

.field public static final MAX_CHARS:I = 0x800000

.field private static final MAX_DEPTH:I = 0x40

.field public static final MAX_ITEMS:I = 0x1000

.field private static final MAX_NODES:I = 0x186a0

.field private static final NULL_VALUE:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 95
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->NULL_VALUE:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    .registers 1

    .line 17
    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Ljava/util/List;)Ljava/util/List;
    .registers 1

    .line 17
    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->immutable(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200()Ljava/lang/Object;
    .registers 1

    .line 17
    sget-object v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->NULL_VALUE:Ljava/lang/Object;

    return-object v0
.end method

.method private static add(Ljava/util/Map;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;>;",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;",
            "I)V"
        }
    .end annotation

    .line 245
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_10

    .line 246
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    :cond_10
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static capture(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;
    .registers 2

    .line 253
    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->decodeResponse(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->captureDecoded(Ljava/lang/String;Ljava/util/Map;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;

    move-result-object p0

    return-object p0
.end method

.method static captureDecoded(Ljava/lang/String;Ljava/util/Map;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;
    .registers 30
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "**>;)",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;"
        }
    .end annotation

    move-object/from16 v0, p1

    .line 267
    const-string v1, "profiles"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->collection(Ljava/util/Map;Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v1

    .line 268
    const-string v3, "groups"

    invoke-static {v0, v3, v2}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->collection(Ljava/util/Map;Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v3

    .line 269
    const-string v4, "items"

    const/4 v5, 0x1

    invoke-static {v0, v4, v5}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->collection(Ljava/util/Map;Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v0

    .line 270
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 271
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 272
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 273
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    move v7, v2

    move v11, v7

    move v12, v11

    .line 275
    :goto_2d
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v10

    const-wide/32 v13, 0x7fffffff

    const-string v15, "id"

    if-ge v7, v10, :cond_72

    .line 276
    sget-object v10, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->USER:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    const-string v5, "invalid profile entry"

    invoke-static {v2, v5}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->object(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v10, v2}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->key(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;Ljava/lang/Object;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    move-result-object v2

    .line 277
    invoke-interface {v8, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {v4, v2, v7}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->add(Ljava/util/Map;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;I)V

    move-object/from16 p1, v4

    .line 278
    iget-wide v4, v2, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    cmp-long v4, v4, v13

    if-lez v4, :cond_5c

    const/4 v4, 0x1

    goto :goto_5d

    :cond_5c
    const/4 v4, 0x0

    :goto_5d
    or-int/2addr v11, v4

    .line 279
    iget-wide v4, v2, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    const-wide/32 v13, 0x77359400

    cmp-long v2, v4, v13

    if-ltz v2, :cond_69

    const/4 v2, 0x1

    goto :goto_6a

    :cond_69
    const/4 v2, 0x0

    :goto_6a
    or-int/2addr v12, v2

    add-int/lit8 v7, v7, 0x1

    move-object/from16 v4, p1

    const/4 v2, 0x0

    const/4 v5, 0x1

    goto :goto_2d

    :cond_72
    move-object/from16 p1, v4

    const/4 v1, 0x0

    .line 281
    :goto_75
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_98

    .line 282
    sget-object v2, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->GROUP:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    const-string v5, "invalid group entry"

    invoke-static {v4, v5}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->object(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v2, v4}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->key(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;Ljava/lang/Object;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    move-result-object v2

    .line 283
    invoke-interface {v9, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {v6, v2, v1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->add(Ljava/util/Map;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_75

    .line 285
    :cond_98
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 286
    :goto_a1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_179

    .line 287
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    const-string v7, "invalid item"

    invoke-static {v5, v7}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->object(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v5

    .line 288
    const-string v7, "conversation"

    invoke-interface {v5, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    const-string v13, "invalid conversation"

    invoke-static {v7, v13}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->object(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v7

    .line 289
    const-string v13, "peer"

    invoke-interface {v7, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    const-string v13, "invalid peer"

    invoke-static {v7, v13}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->object(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v7

    .line 290
    const-string v13, "last_message"

    invoke-interface {v5, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    const-string v13, "invalid message"

    invoke-static {v5, v13}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->object(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v5

    .line 291
    const-string v13, "type"

    invoke-interface {v7, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    .line 292
    instance-of v14, v13, Ljava/lang/String;

    const-string v17, "unknown peer type"

    if-eqz v14, :cond_174

    .line 294
    const-string v14, "user"

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_ec

    sget-object v13, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->USER:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    goto :goto_101

    .line 295
    :cond_ec
    const-string v14, "group"

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_f7

    sget-object v13, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->GROUP:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    goto :goto_101

    .line 296
    :cond_f7
    const-string v14, "chat"

    invoke-virtual {v14, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_16f

    sget-object v13, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->CHAT:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    .line 298
    :goto_101
    invoke-interface {v7, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v13, v7}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->key(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;Ljava/lang/Object;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    move-result-object v7

    .line 299
    sget-object v14, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->AUTHOR_UNTYPED:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    move-object/from16 v27, v0

    const-string v0, "from_id"

    invoke-interface {v5, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v14, v0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->key(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;Ljava/lang/Object;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    move-result-object v20

    .line 300
    sget-object v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->MESSAGE:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    invoke-interface {v5, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v0, v5}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->key(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;Ljava/lang/Object;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    move-result-object v0

    move-object/from16 v5, p1

    .line 301
    invoke-static {v5, v7}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->matching(Ljava/util/Map;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Ljava/util/List;

    move-result-object v22

    .line 302
    invoke-static {v6, v7}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->matching(Ljava/util/Map;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Ljava/util/List;

    move-result-object v23

    .line 303
    sget-object v14, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->CHAT:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-eq v13, v14, :cond_13c

    invoke-interface/range {v22 .. v22}, Ljava/util/List;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_13c

    invoke-interface/range {v23 .. v23}, Ljava/util/List;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_13c

    const/4 v3, 0x1

    .line 304
    :cond_13c
    iget-wide v13, v7, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    const-wide/32 v25, 0x7fffffff

    cmp-long v13, v13, v25

    if-lez v13, :cond_147

    const/4 v13, 0x1

    goto :goto_148

    :cond_147
    const/4 v13, 0x0

    :goto_148
    or-int/2addr v1, v13

    .line 305
    iget-wide v13, v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    cmp-long v13, v13, v25

    if-lez v13, :cond_151

    const/4 v13, 0x1

    goto :goto_152

    :cond_151
    const/4 v13, 0x0

    :goto_152
    or-int/2addr v2, v13

    .line 306
    new-instance v13, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;

    const/16 v24, 0x0

    move-object/from16 v17, v13

    move/from16 v18, v4

    move-object/from16 v19, v7

    move-object/from16 v21, v0

    invoke-direct/range {v17 .. v24}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;-><init>(ILorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Ljava/util/List;Ljava/util/List;Lorg/vtlite/reborn/id64/LosslessResponseShadow$1;)V

    invoke-interface {v10, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    move-object/from16 p1, v5

    move-wide/from16 v13, v25

    move-object/from16 v0, v27

    goto/16 :goto_a1

    .line 297
    :cond_16f
    invoke-static/range {v17 .. v17}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object v0

    throw v0

    .line 292
    :cond_174
    invoke-static/range {v17 .. v17}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object v0

    throw v0

    .line 308
    :cond_179
    new-instance v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;

    const/16 v16, 0x0

    move-object v6, v0

    move-object/from16 v7, p0

    move v13, v1

    move v14, v2

    move v15, v3

    invoke-direct/range {v6 .. v16}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZZZZZLorg/vtlite/reborn/id64/LosslessResponseShadow$1;)V

    return-object v0
.end method

.method private static collection(Ljava/util/Map;Ljava/lang/String;Z)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "**>;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    .line 219
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_d

    if-nez p2, :cond_d

    .line 220
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 221
    :cond_d
    instance-of p1, p0, Ljava/util/List;

    if-eqz p1, :cond_23

    .line 222
    check-cast p0, Ljava/util/List;

    .line 223
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p1

    const/16 p2, 0x1000

    if-gt p1, p2, :cond_1c

    return-object p0

    :cond_1c
    const-string p0, "oversized collection"

    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0

    .line 221
    :cond_23
    const-string p0, "invalid collection"

    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0
.end method

.method static cp485SignedSender(Ljava/lang/Object;)Ljava/lang/Long;
    .registers 7

    .line 227
    instance-of v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return-object v1

    .line 228
    :cond_6
    check-cast p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;

    iget-object p0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;->text:Ljava/lang/String;

    const/16 v0, 0x2e

    .line 229
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_3a

    const/16 v0, 0x65

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_3a

    const/16 v0, 0x45

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_3a

    :try_start_22
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p0
    :try_end_26
    .catch Ljava/lang/NumberFormatException; {:try_start_22 .. :try_end_26} :catch_3a

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_3a

    const-wide v4, -0x8000000000000000L

    cmp-long v0, v2, v4

    if-eqz v0, :cond_3a

    return-object p0

    :catch_3a
    :cond_3a
    return-object v1
.end method

.method static decodeResponse(Ljava/lang/String;)Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "**>;"
        }
    .end annotation

    if-eqz p0, :cond_43

    .line 257
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_43

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/high16 v1, 0x800000

    if-gt v0, v1, :cond_43

    .line 259
    new-instance v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;

    invoke-direct {v0, p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 260
    invoke-virtual {v0, p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->value(I)Ljava/lang/Object;

    move-result-object p0

    const-string v1, "invalid envelope"

    invoke-static {p0, v1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->object(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    .line 261
    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->space()V

    .line 262
    iget v1, v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    iget v0, v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    if-ne v1, v0, :cond_3c

    .line 263
    const-string v0, "response"

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3b

    .line 264
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    const-string v0, "invalid response envelope"

    invoke-static {p0, v0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->object(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/Map;

    move-result-object p0

    :cond_3b
    return-object p0

    .line 262
    :cond_3c
    const-string p0, "invalid JSON document"

    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0

    .line 258
    :cond_43
    const-string p0, "invalid payload size"

    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0
.end method

.method private static fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    .registers 2

    .line 87
    new-instance v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    invoke-direct {v0, p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method static hasIncompatibleProfile(Ljava/util/Map;)Z
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "**>;)Z"
        }
    .end annotation

    .line 269
    const-string v0, "profiles"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->collection(Ljava/util/Map;Ljava/lang/String;Z)Ljava/util/List;

    move-result-object p0

    .line 270
    nop

    .line 271
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v6, 0x0

    :cond_d
    :goto_d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_39

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 272
    :try_start_17
    sget-object v3, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->USER:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    const-string v4, "invalid profile entry"

    invoke-static {v2, v4}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->object(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    const-string v4, "id"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v3, v2}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->key(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;Ljava/lang/Object;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    move-result-object v2

    .line 273
    iget-wide v2, v2, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    const-wide/32 v4, 0x77359400

    cmp-long v2, v2, v4
    :try_end_30
    .catch Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException; {:try_start_17 .. :try_end_30} :catch_34

    if-ltz v2, :cond_d

    const/4 v0, 0x1

    return v0

    :catch_34
    move-exception v2

    if-nez v6, :cond_d

    move-object v6, v2

    goto :goto_d

    :cond_39
    if-eqz v6, :cond_3c

    throw v6

    :cond_3c
    return v1
.end method

.method private static immutable(Ljava/util/List;)Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 89
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static key(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;Ljava/lang/Object;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;
    .registers 5

    .line 233
    instance-of v0, p1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;

    const-string v1, "identity is not integral number"

    if-eqz v0, :cond_39

    .line 234
    check-cast p1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;

    iget-object p1, p1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;->text:Ljava/lang/String;

    const/16 v0, 0x2e

    .line 235
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_34

    const/16 v0, 0x65

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_34

    const/16 v0, 0x45

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_34

    .line 237
    :try_start_22
    new-instance v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    const/4 p1, 0x0

    invoke-direct {v0, p0, v1, v2, p1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;-><init>(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;JLorg/vtlite/reborn/id64/LosslessResponseShadow$1;)V
    :try_end_2c
    .catch Ljava/lang/NumberFormatException; {:try_start_22 .. :try_end_2c} :catch_2d

    return-object v0

    .line 238
    :catch_2d
    const-string p0, "identity outside signed int64"

    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0

    .line 236
    :cond_34
    invoke-static {v1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0

    .line 233
    :cond_39
    invoke-static {v1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0
.end method

.method private static matching(Ljava/util/Map;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;>;",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 241
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-nez p0, :cond_c

    .line 242
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    :cond_c
    return-object p0
.end method

.method static nonnegativeMetadata(Ljava/lang/Object;)Ljava/lang/Long;
    .registers 3

    .line 227
    instance-of v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return-object v1

    .line 228
    :cond_6
    check-cast p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;

    iget-object p0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;->text:Ljava/lang/String;

    const/16 v0, 0x2e

    .line 229
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_30

    const/16 v0, 0x65

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_30

    const/16 v0, 0x45

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_30

    const-string v0, "-"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2b

    goto :goto_30

    .line 230
    :cond_2b
    :try_start_2b
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p0
    :try_end_2f
    .catch Ljava/lang/NumberFormatException; {:try_start_2b .. :try_end_2f} :catch_30

    return-object p0

    :catch_30
    :cond_30
    :goto_30
    return-object v1
.end method

.method private static object(Ljava/lang/Object;Ljava/lang/String;)Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "**>;"
        }
    .end annotation

    .line 215
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_7

    .line 216
    check-cast p0, Ljava/util/Map;

    return-object p0

    .line 215
    :cond_7
    invoke-static {p1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0
.end method
