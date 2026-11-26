.class public final Lorg/vtlite/reborn/id64/DialogPageModel;
.super Ljava/lang/Object;
.source "DialogPageModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;,
        Lorg/vtlite/reborn/id64/DialogPageModel$Row;,
        Lorg/vtlite/reborn/id64/DialogPageModel$Page;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static capture(Ljava/lang/String;)Lorg/vtlite/reborn/id64/DialogPageModel$Page;
    .registers 21

    move-object/from16 v0, p0

    if-eqz v0, :cond_17b

    .line 71
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v1

    const/high16 v2, 0x80000

    if-gt v1, v2, :cond_17b

    .line 72
    invoke-static/range {p0 .. p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->decodeResponse(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    .line 73
    invoke-static {v0, v1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->captureDecoded(Ljava/lang/String;Ljava/util/Map;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;

    move-result-object v0

    .line 74
    const-string v2, "profiles"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorg/vtlite/reborn/id64/DialogPageModel;->list(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    const-string v3, "groups"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lorg/vtlite/reborn/id64/DialogPageModel;->list(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    const-string v4, "items"

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lorg/vtlite/reborn/id64/DialogPageModel;->list(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 75
    iget-object v4, v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->profiles:Ljava/util/List;

    invoke-static {v4}, Lorg/vtlite/reborn/id64/DialogPageModel;->index(Ljava/util/List;)Ljava/util/Map;

    move-result-object v4

    iget-object v5, v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->groups:Ljava/util/List;

    invoke-static {v5}, Lorg/vtlite/reborn/id64/DialogPageModel;->index(Ljava/util/List;)Ljava/util/Map;

    move-result-object v5

    .line 76
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 77
    iget-object v7, v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->items:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_49
    const/4 v8, 0x0

    move-object/from16 v19, v8

    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_174

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    move-object v11, v8

    check-cast v11, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;

    .line 78
    iget v8, v11, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->position:I

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, Lorg/vtlite/reborn/id64/DialogPageModel;->map(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v8

    const-string v10, "conversation"

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-static {v10}, Lorg/vtlite/reborn/id64/DialogPageModel;->map(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v10

    const-string v12, "last_message"

    invoke-interface {v8, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, Lorg/vtlite/reborn/id64/DialogPageModel;->map(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v8

    .line 79
    sget-object v12, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->MISSING:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    .line 80
    iget-object v13, v11, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    iget-object v13, v13, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    sget-object v14, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->CHAT:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    const/16 v15, 0x100

    if-ne v13, v14, :cond_b0

    .line 81
    const-string v9, "chat_settings"

    invoke-interface {v10, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-static {v9}, Lorg/vtlite/reborn/id64/DialogPageModel;->map(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v9

    const-string v13, "photo"

    invoke-interface {v9, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    invoke-static {v13}, Lorg/vtlite/reborn/id64/DialogPageModel;->map(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v13

    invoke-static {v13}, Lorg/vtlite/reborn/id64/CP579Avatar;->photo(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v19, v13

    const-string v13, "title"

    invoke-interface {v9, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-static {v9, v15}, Lorg/vtlite/reborn/id64/DialogPageModel;->visible(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v9

    move-object/from16 v17, v10

    :goto_a9
    move-object/from16 v18, v12

    move-object v12, v9

    move-object/from16 v9, v18

    goto/16 :goto_13c

    .line 85
    :cond_b0
    iget-object v13, v11, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    iget-object v13, v13, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    sget-object v14, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->GROUP:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-ne v13, v14, :cond_ca

    iget-object v13, v11, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    iget-wide v13, v13, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    const-wide/16 v16, 0x0

    cmp-long v13, v13, v16

    if-lez v13, :cond_ca

    sget-object v12, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->UNSUPPORTED_SIGN:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    move-object/from16 v17, v10

    :cond_c6
    :goto_c6
    move-object v9, v12

    const/4 v12, 0x0

    goto/16 :goto_13c

    .line 87
    :cond_ca
    iget-object v13, v11, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    iget-object v13, v13, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    sget-object v14, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->USER:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    const/4 v15, 0x1

    if-ne v13, v14, :cond_d5

    move v13, v15

    goto :goto_d6

    :cond_d5
    const/4 v13, 0x0

    :goto_d6
    if-eqz v13, :cond_df

    .line 88
    iget-object v14, v11, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    move-object/from16 v17, v10

    iget-wide v9, v14, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    goto :goto_e6

    :cond_df
    move-object/from16 v17, v10

    iget-object v9, v11, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    iget-wide v9, v9, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    neg-long v9, v9

    :goto_e6
    if-eqz v13, :cond_ea

    move-object v14, v4

    goto :goto_eb

    :cond_ea
    move-object v14, v5

    .line 89
    :goto_eb
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {v14, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    if-eqz v9, :cond_100

    .line 90
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    if-le v10, v15, :cond_100

    sget-object v12, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->AMBIGUOUS:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    goto :goto_c6

    :cond_100
    if-eqz v9, :cond_c6

    .line 91
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    if-ne v10, v15, :cond_c6

    if-eqz v13, :cond_10c

    move-object v10, v2

    goto :goto_10d

    :cond_10c
    move-object v10, v3

    :goto_10d
    const/4 v14, 0x0

    .line 92
    invoke-interface {v9, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-static {v9}, Lorg/vtlite/reborn/id64/DialogPageModel;->map(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v9

    invoke-static {v9}, Lorg/vtlite/reborn/id64/CP579Avatar;->photo(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v10

    move-object/from16 v19, v10

    if-eqz v13, :cond_12e

    .line 93
    invoke-static {v9}, Lorg/vtlite/reborn/id64/DialogPageModel;->userTitle(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_a9

    :cond_12e
    const-string v10, "name"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    const/16 v10, 0x100

    invoke-static {v9, v10}, Lorg/vtlite/reborn/id64/DialogPageModel;->visible(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_a9

    :goto_13c
    if-eqz v12, :cond_140

    .line 97
    sget-object v9, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->RESOLVED:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    :cond_140
    move-object v13, v9

    .line 98
    new-instance v9, Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    const-string v10, "text"

    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    const/16 v14, 0x200

    invoke-static {v10, v14}, Lorg/vtlite/reborn/id64/DialogPageModel;->visible(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v14

    const-string v10, "date"

    .line 99
    invoke-interface {v8, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->nonnegativeMetadata(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v15

    const-string v8, "unread_count"

    move-object/from16 v10, v17

    .line 100
    invoke-interface {v10, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->nonnegativeMetadata(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v16

    const/16 v17, 0x0

    move-object v10, v9

    invoke-direct/range {v10 .. v17}, Lorg/vtlite/reborn/id64/DialogPageModel$Row;-><init>(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;Ljava/lang/String;Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Lorg/vtlite/reborn/id64/DialogPageModel$1;)V

    .line 98
    move-object/from16 v8, v19

    iput-object v8, v9, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->cp579Avatar:Ljava/lang/String;

    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_49

    .line 102
    :cond_174
    new-instance v1, Lorg/vtlite/reborn/id64/DialogPageModel$Page;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v6, v2}, Lorg/vtlite/reborn/id64/DialogPageModel$Page;-><init>(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;Ljava/util/List;Lorg/vtlite/reborn/id64/DialogPageModel$1;)V

    return-object v1

    .line 71
    :cond_17b
    new-instance v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    const-string v1, "projection size limit"

    invoke-direct {v0, v1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static index(Ljava/util/List;)Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 64
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x0

    .line 65
    :goto_6
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_32

    .line 66
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    iget-wide v2, v2, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 67
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-nez v3, :cond_28

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_28
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_32
    return-object v0
.end method

.method private static list(Ljava/lang/Object;)Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    .line 42
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_7

    check-cast p0, Ljava/util/List;

    goto :goto_b

    :cond_7
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    :goto_b
    return-object p0
.end method

.method private static map(Ljava/lang/Object;)Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map<",
            "**>;"
        }
    .end annotation

    .line 41
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_7

    check-cast p0, Ljava/util/Map;

    goto :goto_b

    :cond_7
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object p0

    :goto_b
    return-object p0
.end method

.method private static userTitle(Ljava/util/Map;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "**>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 60
    const-string v0, "first_name"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const/16 v1, 0x80

    invoke-static {v0, v1}, Lorg/vtlite/reborn/id64/DialogPageModel;->visible(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object v0

    const-string v2, "last_name"

    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0, v1}, Lorg/vtlite/reborn/id64/DialogPageModel;->visible(Ljava/lang/Object;I)Ljava/lang/String;

    move-result-object p0

    if-nez v0, :cond_1a

    move-object v0, p0

    goto :goto_31

    :cond_1a
    if-nez p0, :cond_1d

    goto :goto_31

    .line 61
    :cond_1d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_31
    return-object v0
.end method

.method private static visible(Ljava/lang/Object;I)Ljava/lang/String;
    .registers 8

    .line 46
    instance-of v0, p0, Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return-object v1

    .line 47
    :cond_6
    check-cast p0, Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    .line 48
    :cond_e
    :goto_e
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_6e

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-ge v3, p1, :cond_6e

    .line 49
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->charCount(I)I

    move-result v4

    add-int/2addr v2, v4

    const/16 v4, 0xd

    if-eq v3, v4, :cond_2f

    const/16 v4, 0xa

    if-eq v3, v4, :cond_2f

    const/16 v4, 0x9

    if-ne v3, v4, :cond_31

    :cond_2f
    const/16 v3, 0x20

    .line 51
    :cond_31
    invoke-static {v3}, Ljava/lang/Character;->isISOControl(I)Z

    move-result v4

    if-nez v4, :cond_e

    const/16 v4, 0x61c

    if-eq v3, v4, :cond_e

    const/16 v4, 0x200e

    if-eq v3, v4, :cond_e

    const/16 v4, 0x200f

    if-eq v3, v4, :cond_e

    const/16 v4, 0x202a

    if-lt v3, v4, :cond_4b

    const/16 v4, 0x202e

    if-le v3, v4, :cond_e

    :cond_4b
    const/16 v4, 0x2066

    if-lt v3, v4, :cond_53

    const/16 v4, 0x2069

    if-le v3, v4, :cond_e

    :cond_53
    const v4, 0xd800

    if-lt v3, v4, :cond_5e

    const v4, 0xdfff

    if-gt v3, v4, :cond_5e

    goto :goto_e

    .line 54
    :cond_5e
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    invoke-static {v3}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v4, v5

    if-le v4, p1, :cond_6a

    goto :goto_6e

    .line 55
    :cond_6a
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    goto :goto_e

    .line 57
    :cond_6e
    :goto_6e
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_7d

    goto :goto_7e

    :cond_7d
    move-object v1, p0

    :goto_7e
    return-object v1
.end method
