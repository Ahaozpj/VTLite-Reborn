.class public final Lorg/vtlite/reborn/id64/Id64HistoryProbe;
.super Ljava/lang/Object;
.source "Id64HistoryProbe.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/vk/api/sdk/VKApiResponseParser;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;",
        "Lcom/vk/api/sdk/VKApiResponseParser<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static final MAX_ITEMS:I = 0x14

.field private static final MAX_RESPONSE:I = 0x80000

.field private static final TRACE_TAG:Ljava/lang/String; = "RebornCP427"


# instance fields
.field private dialog:Landroid/app/AlertDialog;

.field private volatile finished:Z

.field private final peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

.field private volatile rendered:Ljava/lang/String;

.field private final scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

.field private final source:Landroid/view/View;

.field private final ticket:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

.field private final ui:Landroid/os/Handler;


# direct methods
.method private constructor <init>(Landroid/view/View;Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)V
    .registers 5

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->source:Landroid/view/View;

    iput-object p2, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->ticket:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    iput-object p3, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

    iput-object p4, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    .line 42
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->ui:Landroid/os/Handler;

    .line 43
    return-void
.end method

.method private static asMap(Ljava/lang/Object;)Ljava/util/Map;
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

    .line 174
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_7

    check-cast p0, Ljava/util/Map;

    goto :goto_8

    :cond_7
    const/4 p0, 0x0

    :goto_8
    return-object p0
.end method

.method private static clean(Ljava/lang/Object;)Ljava/lang/String;
    .registers 7

    .line 177
    instance-of v0, p0, Ljava/lang/String;

    if-nez v0, :cond_7

    const-string p0, "[\u0412\u043b\u043e\u0436\u0435\u043d\u0438\u0435 \u0438\u043b\u0438 \u043d\u0435\u0442 \u0442\u0435\u043a\u0441\u0442\u0430]"

    return-object p0

    .line 178
    :cond_7
    check-cast p0, Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    const/4 v1, 0x0

    :cond_f
    :goto_f
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_6b

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    const/16 v3, 0xb4

    if-ge v2, v3, :cond_6b

    .line 180
    invoke-virtual {p0, v1}, Ljava/lang/String;->codePointAt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->charCount(I)I

    move-result v4

    add-int/2addr v1, v4

    .line 181
    invoke-static {v2}, Ljava/lang/Character;->isISOControl(I)Z

    move-result v4

    if-nez v4, :cond_f

    const/16 v4, 0x61c

    if-eq v2, v4, :cond_f

    const/16 v4, 0x200e

    if-eq v2, v4, :cond_f

    const/16 v4, 0x200f

    if-eq v2, v4, :cond_f

    const/16 v4, 0x202a

    if-lt v2, v4, :cond_40

    const/16 v4, 0x202e

    if-le v2, v4, :cond_f

    :cond_40
    const/16 v4, 0x2066

    if-lt v2, v4, :cond_48

    const/16 v4, 0x2069

    if-le v2, v4, :cond_f

    :cond_48
    const v4, 0xd800

    if-lt v2, v4, :cond_53

    const v4, 0xdfff

    if-gt v2, v4, :cond_53

    .line 183
    goto :goto_f

    .line 184
    :cond_53
    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v4

    if-eqz v4, :cond_5b

    const/16 v2, 0x20

    .line 185
    :cond_5b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    invoke-static {v2}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v4, v5

    if-le v4, v3, :cond_67

    goto :goto_6b

    .line 186
    :cond_67
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    .line 187
    goto :goto_f

    .line 188
    :cond_6b
    :goto_6b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-nez p0, :cond_74

    const-string p0, "[\u0411\u0435\u0437 \u0442\u0435\u043a\u0441\u0442\u0430]"

    goto :goto_78

    :cond_74
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_78
    return-object p0
.end method

.method private static cp439TraceSdkFailure(Ljava/lang/Exception;)V
    .registers 4

    instance-of v0, p0, Lcom/vk/api/sdk/exceptions/VKApiExecutionException;

    if-eqz v0, :cond_37

    const-string v0, "HISTORY_ERROR_API_EXECUTION"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    check-cast p0, Lcom/vk/api/sdk/exceptions/VKApiExecutionException;

    invoke-virtual {p0}, Lcom/vk/api/sdk/exceptions/VKApiExecutionException;->d()I

    move-result v0

    const/16 v1, 0xf

    if-ne v0, v1, :cond_16

    invoke-static {p0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->cp441TraceAccessReason(Lcom/vk/api/sdk/exceptions/VKApiExecutionException;)V

    :cond_16
    if-ltz v0, :cond_31

    const/16 v1, 0x2710

    if-ge v0, v1, :cond_31

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "HISTORY_API_CODE_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    return-void

    :cond_31
    const-string v0, "HISTORY_API_CODE_UNUSUAL"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    return-void

    :cond_37
    instance-of v0, p0, Lcom/vk/api/sdk/exceptions/VKApiIllegalResponseException;

    if-eqz v0, :cond_41

    const-string v0, "HISTORY_ERROR_ILLEGAL_RESPONSE"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    return-void

    :cond_41
    instance-of v0, p0, Ljava/io/IOException;

    if-eqz v0, :cond_4b

    const-string v0, "HISTORY_ERROR_NETWORK_IO"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    return-void

    :cond_4b
    instance-of v0, p0, Ljava/lang/InterruptedException;

    if-eqz v0, :cond_55

    const-string v0, "HISTORY_ERROR_INTERRUPTED"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    return-void

    :cond_55
    instance-of v0, p0, Ljava/lang/ClassCastException;

    if-eqz v0, :cond_5f

    const-string v0, "HISTORY_ERROR_RESULT_CAST"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    return-void

    :cond_5f
    instance-of v0, p0, Ljava/lang/IllegalStateException;

    if-eqz v0, :cond_69

    const-string v0, "HISTORY_ERROR_STATE"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    return-void

    :cond_69
    instance-of v0, p0, Ljava/lang/IllegalArgumentException;

    if-eqz v0, :cond_73

    const-string v0, "HISTORY_ERROR_ARGUMENT"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    return-void

    :cond_73
    instance-of v0, p0, Ljava/lang/SecurityException;

    if-eqz v0, :cond_7d

    const-string v0, "HISTORY_ERROR_SECURITY"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    return-void

    :cond_7d
    instance-of v0, p0, Lcom/vk/api/sdk/exceptions/VKApiException;

    if-eqz v0, :cond_87

    const-string v0, "HISTORY_ERROR_API_OTHER"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    return-void

    :cond_87
    const-string v0, "HISTORY_ERROR_OTHER"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    return-void
.end method

.method private static cp441TraceAccessReason(Lcom/vk/api/sdk/exceptions/VKApiExecutionException;)V
    .registers 5

    if-eqz p0, :cond_7b

    invoke-virtual {p0}, Lcom/vk/api/sdk/exceptions/VKApiExecutionException;->f()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_7b

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x800

    if-gt v2, v3, :cond_7b

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "no access to call this method"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6f

    const-string v1, "method is not available"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6f

    const-string v1, "method is unavailable"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6f

    const-string v1, "cannot call this method"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6f

    const-string v1, "current scopes"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6f

    const-string v1, "app type"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6f

    const-string v1, "not a member of the chat"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_75

    const-string v1, "not a member of this conversation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_75

    const-string v1, "no access to this conversation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_75

    const-string v1, "no access to this chat"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_75

    const-string v1, "private conversation"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_75

    goto :goto_7b

    :cond_6f
    const-string v0, "HISTORY_ACCESS_METHOD_PERMISSION_HINT"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    return-void

    :cond_75
    const-string v0, "HISTORY_ACCESS_PEER_PERMISSION_HINT"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    return-void

    :cond_7b
    :goto_7b
    const-string v0, "HISTORY_ACCESS_UNCLASSIFIED"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    return-void
.end method

.method static cp484FirstPage(Ljava/lang/String;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Lorg/vtlite/reborn/id64/CP484HistoryResult;
    .registers 22

    .line 192
    move-object/from16 v0, p1

    const-string v1, "from_id"

    invoke-static/range {p1 .. p1}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->supported(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Z

    move-result v2

    if-eqz v2, :cond_1e0

    if-eqz p0, :cond_1e0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v2

    const/high16 v3, 0x80000

    if-le v2, v3, :cond_17

    goto/32 :goto_1e0

    .line 195
    :cond_17
    :try_start_17
    invoke-static/range {p0 .. p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->decodeResponse(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    .line 196
    if-nez v2, :cond_25

    const-string v0, "\u041e\u0442\u0432\u0435\u0442 \u0431\u0435\u0437 \u0434\u0430\u043d\u043d\u044b\u0445"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    .line 197
    :cond_25
    const-string v3, "items"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 198
    instance-of v4, v3, Ljava/util/List;

    if-nez v4, :cond_37

    const-string v0, "\u041e\u0442\u0432\u0435\u0442 \u0431\u0435\u0437 \u0441\u043f\u0438\u0441\u043a\u0430 \u0441\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u0439"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    .line 199
    :cond_37
    check-cast v3, Ljava/util/List;

    .line 200
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    const/16 v5, 0x14

    if-le v4, v5, :cond_49

    const-string v0, "\u0421\u043b\u0438\u0448\u043a\u043e\u043c \u043c\u043d\u043e\u0433\u043e \u0441\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u0439"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    .line 201
    :cond_49
    nop

    .line 202
    const-string v4, "conversations"

    invoke-interface {v2, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 203
    instance-of v4, v2, Ljava/util/List;
    :try_end_56
    .catch Ljava/lang/RuntimeException; {:try_start_17 .. :try_end_56} :catch_1d7

    const-string v6, "id"

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-eqz v4, :cond_1e8

    .line 204
    :try_start_5c
    check-cast v2, Ljava/util/List;

    .line 205
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-eq v4, v7, :cond_6c

    const-string v0, "\u041d\u0435\u043e\u0434\u043d\u043e\u0437\u043d\u0430\u0447\u043d\u0430\u044f \u0438\u0441\u0442\u043e\u0440\u0438\u044f"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    .line 206
    :cond_6c
    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->asMap(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    .line 207
    if-nez v2, :cond_7a

    const/4 v2, 0x0

    goto/32 :goto_84

    :cond_7a
    const-string v4, "peer"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->asMap(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    .line 208
    :goto_84
    if-eqz v2, :cond_c6

    invoke-interface {v2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iget-wide v9, v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    invoke-static {v4, v9, v10}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->same(Ljava/lang/Object;J)Z

    move-result v4

    if-nez v4, :cond_95

    goto/32 :goto_c6

    .line 209
    :cond_95
    const-string v4, "type"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 210
    iget-object v4, v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    sget-object v9, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->USER:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-ne v4, v9, :cond_a9

    const-string v4, "user"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_ba

    :cond_a9
    iget-object v4, v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    sget-object v9, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->CHAT:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-ne v4, v9, :cond_be

    const-string v4, "chat"

    .line 211
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_ba

    goto/32 :goto_be

    .line 213
    :cond_ba
    move v2, v7

    goto/32 :goto_cf

    .line 212
    :cond_be
    :goto_be
    const-string v0, "\u0422\u0438\u043f \u043f\u0435\u0440\u0435\u043f\u0438\u0441\u043a\u0438 \u043d\u0435 \u0441\u043e\u0432\u043f\u0430\u0434\u0430\u0435\u0442"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    .line 208
    :cond_c6
    :goto_c6
    const-string v0, "\u041f\u0435\u0440\u0435\u043f\u0438\u0441\u043a\u0430 \u043d\u0435 \u0441\u043e\u0432\u043f\u0430\u0434\u0430\u0435\u0442 \u0441 \u0437\u0430\u043f\u0440\u043e\u0441\u043e\u043c"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    .line 203
    :cond_ce
    move v2, v8

    .line 215
    :goto_cf
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object/16 v17, v4

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v9, "ID64 \u00b7 \u043f\u0435\u0440\u0432\u044b\u0435 \u0441\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u044f (\u0442\u043e\u043b\u044c\u043a\u043e \u0447\u0442\u0435\u043d\u0438\u0435)\n\n"

    invoke-direct {v4, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 216
    nop

    .line 217
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 218
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_e8
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_1a7

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    .line 219
    invoke-static {v11}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->asMap(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v11

    .line 220
    if-eqz v11, :cond_19f

    const-string v12, "peer_id"

    invoke-interface {v11, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    iget-wide v13, v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    invoke-static {v12, v13, v14}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->same(Ljava/lang/Object;J)Z

    move-result v12

    if-eqz v12, :cond_19f

    .line 221
    invoke-interface {v11, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-static {v12}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->exact(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v12

    if-eqz v12, :cond_19f

    invoke-interface {v11, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-static {v12}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->cp485SignedSender(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v12

    if-nez v12, :cond_11d

    goto/32 :goto_19f

    .line 223
    :cond_11d
    invoke-interface {v11, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    invoke-static {v12}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->exact(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v12

    .line 224
    invoke-interface {v11, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    invoke-static {v13}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->cp485SignedSender(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v13

    .line 225
    if-eqz v13, :cond_197

    move-object/16 v19, v13

    invoke-virtual {v13}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    const-wide/16 v15, 0x0

    cmp-long v13, v13, v15

    if-nez v13, :cond_13f

    goto/32 :goto_197

    .line 227
    :cond_13f
    invoke-virtual {v12}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    cmp-long v13, v13, v15

    if-lez v13, :cond_18f

    move-object/16 v18, v12

    invoke-virtual {v9, v12}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_153

    goto/32 :goto_18f

    .line 229
    :cond_153
    add-int/2addr v8, v7

    if-le v8, v5, :cond_15e

    const-string v0, "\u041b\u0438\u043c\u0438\u0442 \u0441\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u0439"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    .line 230
    :cond_15e
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ". "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "text"

    invoke-interface {v11, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    invoke-static {v11}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->clean(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    move-object/from16 v13, v18

    move-object/from16 v14, v19

    invoke-static {v13, v14, v11}, Lorg/vtlite/reborn/id64/CP500HistoryRow;->of(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;)Lorg/vtlite/reborn/id64/CP500HistoryRow;

    move-result-object v13

    move-object/from16 v14, v17

    invoke-interface {v14, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const/16 v12, 0xa

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 231
    goto/32 :goto_e8

    .line 228
    :cond_18f
    :goto_18f
    const-string v0, "\u041f\u043e\u0432\u0442\u043e\u0440\u044f\u044e\u0449\u0438\u0439\u0441\u044f \u0438\u043b\u0438 \u043d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0439 ID \u0441\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u044f"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    .line 226
    :cond_197
    :goto_197
    const-string v0, "\u041d\u0435\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u043c\u044b\u0439 \u0438\u0434\u0435\u043d\u0442\u0438\u0444\u0438\u043a\u0430\u0442\u043e\u0440 \u043e\u0442\u043f\u0440\u0430\u0432\u0438\u0442\u0435\u043b\u044f"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    .line 222
    :cond_19f
    :goto_19f
    const-string v0, "\u041e\u0442\u0432\u0435\u0442 \u0441\u043e\u0434\u0435\u0440\u0436\u0438\u0442 \u043d\u0435\u0441\u043e\u0432\u043f\u0430\u0434\u0430\u044e\u0449\u0438\u0435 \u0438\u043b\u0438 \u043d\u0435\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u043c\u044b\u0435 ID"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    .line 232
    :cond_1a7
    if-nez v2, :cond_1b7

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1b7

    const-string v0, "\u041f\u0443\u0441\u0442\u0430\u044f \u0438\u0441\u0442\u043e\u0440\u0438\u044f \u0431\u0435\u0437 \u043f\u043e\u0434\u0442\u0432\u0435\u0440\u0436\u0434\u0435\u043d\u0438\u044f peer_id"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    .line 233
    :cond_1b7
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1c9

    const-string v0, "\u0412 \u043f\u0435\u0440\u0435\u043f\u0438\u0441\u043a\u0435 \u043d\u0435\u0442 \u0441\u043e\u043e\u0431\u0449\u0435\u043d\u0438\u0439"

    const/4 v1, 0x2

    move-object/from16 v2, p1

    move-object/from16 v3, v17

    invoke-static {v1, v0, v2, v3}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->cp500OfRows(ILjava/lang/String;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Ljava/util/List;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    .line 234
    :cond_1c9
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1cd
    .catch Ljava/lang/RuntimeException; {:try_start_5c .. :try_end_1cd} :catch_1d7

    const/4 v1, 0x1

    move-object/from16 v2, p1

    move-object/from16 v3, v17

    invoke-static {v1, v0, v2, v3}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->cp500OfRows(ILjava/lang/String;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Ljava/util/List;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    .line 235
    :catch_1d7
    move-exception v0

    const-string v0, "\u0424\u043e\u0440\u043c\u0430\u0442 \u0438\u0441\u0442\u043e\u0440\u0438\u0438 \u043f\u043e\u043a\u0430 \u043d\u0435 \u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u0442\u0441\u044f"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    .line 193
    :cond_1e0
    :goto_1e0
    const-string v0, "\u041d\u0435\u043f\u043e\u0434\u0434\u0435\u0440\u0436\u0438\u0432\u0430\u0435\u043c\u0430\u044f \u0438\u0441\u0442\u043e\u0440\u0438\u044f"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0

    :cond_1e8
    if-eqz v9, :cond_ce

    const-string v0, "\u041d\u0435\u043a\u043e\u0440\u0440\u0435\u043a\u0442\u043d\u044b\u0435 \u043c\u0435\u0442\u0430\u0434\u0430\u043d\u043d\u044b\u0435 \u043f\u0435\u0440\u0435\u043f\u0438\u0441\u043a\u0438"

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP484HistoryResult;->of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    return-object v0
.end method

.method private current()Z
    .registers 4

    .line 62
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->finished:Z

    if-nez v0, :cond_28

    iget-object v0, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->ticket:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    if-eqz v0, :cond_28

    iget-object v0, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->ticket:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368StillCurrent()Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->source:Landroid/view/View;

    .line 63
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->ticket:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    iget-object v2, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->source:Landroid/view/View;

    check-cast v2, Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;

    invoke-virtual {v0, v1, v2}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->boundTo(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;)Z

    move-result v0

    if-eqz v0, :cond_28

    const/4 v0, 0x1

    goto :goto_29

    :cond_28
    const/4 v0, 0x0

    .line 62
    :goto_29
    return v0
.end method

.method private static exact(Ljava/lang/Object;)Ljava/lang/Long;
    .registers 1

    .line 169
    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->nonnegativeMetadata(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method static firstPage(Ljava/lang/String;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Ljava/lang/String;
    .registers 3

    invoke-static {p0, p1}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->cp484FirstPage(Ljava/lang/String;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v0

    iget-object v0, v0, Lorg/vtlite/reborn/id64/CP484HistoryResult;->text:Ljava/lang/String;

    return-object v0
.end method

.method public static launch(Landroid/view/View;Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Z
    .registers 5

    const/4 v0, 0x0

    return v0
.end method

.method public static peersForPreview(Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/vtlite/reborn/id64/DialogPageModel$Page;",
            ")",
            "Ljava/util/List<",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;",
            ">;"
        }
    .end annotation

    .line 47
    if-eqz p0, :cond_36

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->rows:Ljava/util/List;

    if-nez v0, :cond_7

    goto :goto_36

    .line 48
    :cond_7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    iget-object p0, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->rows:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_12
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    .line 50
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/16 v3, 0x14

    if-ne v2, v3, :cond_27

    goto :goto_31

    .line 51
    :cond_27
    if-nez v1, :cond_2b

    const/4 v1, 0x0

    goto :goto_2d

    :cond_2b
    iget-object v1, v1, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    :goto_2d
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    goto :goto_12

    .line 53
    :cond_31
    :goto_31
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 47
    :cond_36
    :goto_36
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static same(Ljava/lang/Object;J)Z
    .registers 5

    .line 171
    invoke-static {p0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->exact(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object p0

    if-eqz p0, :cond_10

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    cmp-long p0, v0, p1

    if-nez p0, :cond_10

    const/4 p0, 0x1

    goto :goto_11

    :cond_10
    const/4 p0, 0x0

    :goto_11
    return p0
.end method

.method private static supported(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Z
    .registers 5

    .line 57
    if-eqz p0, :cond_18

    iget-wide v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_18

    iget-object v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    sget-object v1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->USER:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-eq v0, v1, :cond_16

    iget-object p0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    sget-object v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->CHAT:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-ne p0, v0, :cond_18

    :cond_16
    const/4 p0, 0x1

    goto :goto_19

    :cond_18
    const/4 p0, 0x0

    :goto_19
    return p0
.end method

.method private static trace(Ljava/lang/String;)V
    .registers 2

    .line 36
    :try_start_0
    const-string v0, "RebornCP427"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_5} :catch_6

    goto :goto_7

    :catch_6
    move-exception p0

    .line 37
    :goto_7
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4

    .line 100
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/high16 v1, 0x80000

    if-gt v0, v1, :cond_b

    .line 101
    return-object p1

    .line 100
    :cond_b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "ID64_BODY_LIMIT"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public closeOnMain()V
    .registers 3

    .line 106
    const-string v0, "HISTORY_POPUP_CLOSED"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->trace(Ljava/lang/String;)V

    .line 107
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->finished:Z

    .line 108
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->rendered:Ljava/lang/String;

    .line 109
    iget-object v1, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->dialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_16

    iget-object v1, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    iput-object v0, p0, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->dialog:Landroid/app/AlertDialog;

    .line 110
    :cond_16
    return-void
.end method

.method public run()V
    .registers 1

    return-void
.end method
