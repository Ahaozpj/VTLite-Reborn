.class public final Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;
.super Ljava/lang/Object;
.source "RebornCaptchaHostQa.java"


# static fields
.field private static final DEBUG_KEY:Ljava/lang/String; = "__dbg_api_errors"

.field private static final LOG_ONLY:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Sink;

.field private static final TAG:Ljava/lang/String; = "VTLiteCaptchaQA"

.field private static final TOKEN_PHASE:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final WATCH:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

.field private static source:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 20
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->TOKEN_PHASE:Ljava/lang/ThreadLocal;

    .line 22
    new-instance v0, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa$1;

    invoke-direct {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa$1;-><init>()V

    sput-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->LOG_ONLY:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Sink;

    .line 58
    new-instance v0, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa$2;

    invoke-direct {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa$2;-><init>()V

    sput-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->WATCH:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()V
    .registers 0

    .line 15
    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->refresh()V

    return-void
.end method

.method static classifyRejectedUserIdShape(Ljava/lang/Object;I)Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;
    .registers 7
    .param p0, "raw"    # Ljava/lang/Object;
    .param p1, "narrowed"    # I

    .line 254
    if-lez p1, :cond_9

    const v0, 0x77359400

    if-ge p1, v0, :cond_9

    const/4 v0, 0x0

    return-object v0

    .line 256
    :cond_9
    instance-of v0, p0, Ljava/lang/Integer;

    if-nez v0, :cond_38

    instance-of v0, p0, Ljava/lang/Long;

    if-eqz v0, :cond_12

    goto :goto_38

    .line 258
    :cond_12
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_35

    .line 259
    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    .line 260
    .local v0, "text":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_32

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x14

    if-le v1, v2, :cond_28

    goto :goto_32

    .line 262
    :cond_28
    :try_start_28
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1
    :try_end_2c
    .catch Ljava/lang/NumberFormatException; {:try_start_28 .. :try_end_2c} :catch_2e

    .line 263
    .local v1, "exact":J
    nop

    .line 264
    .end local v0    # "text":Ljava/lang/String;
    goto :goto_3f

    .line 263
    .end local v1    # "exact":J
    .restart local v0    # "text":Ljava/lang/String;
    :catch_2e
    move-exception v1

    .local v1, "ignored":Ljava/lang/NumberFormatException;
    sget-object v2, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_ID_RAW_OTHER:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v2

    .line 261
    .end local v1    # "ignored":Ljava/lang/NumberFormatException;
    :cond_32
    :goto_32
    sget-object v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_ID_RAW_OTHER:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v1

    .line 264
    .end local v0    # "text":Ljava/lang/String;
    :cond_35
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_ID_RAW_OTHER:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v0

    .line 257
    :cond_38
    :goto_38
    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    .line 266
    .local v1, "exact":J
    :goto_3f
    const-wide/16 v3, 0x0

    cmp-long v0, v1, v3

    if-gez v0, :cond_48

    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_ID_RAW_NEGATIVE:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v0

    .line 267
    :cond_48
    cmp-long v0, v1, v3

    if-nez v0, :cond_4f

    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_ID_RAW_ZERO:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v0

    .line 268
    :cond_4f
    const-wide/32 v3, 0x7fffffff

    cmp-long v0, v1, v3

    if-lez v0, :cond_59

    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_ID_RAW_POSITIVE_BEYOND_INT32:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v0

    .line 269
    :cond_59
    const-wide/32 v3, 0x77359400

    cmp-long v0, v1, v3

    if-ltz v0, :cond_63

    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_ID_RAW_POSITIVE_ABOVE_LEGACY_LIMIT:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v0

    .line 270
    :cond_63
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_ID_RAW_LEGACY_RANGE_INCONSISTENT:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    return-object v0
.end method

.method public static declared-synchronized cp520DiagnosticsEnabled()Z
    .registers 4

    const-class v0, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_4
    sget-object v2, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->source:Landroid/content/SharedPreferences;

    if-eqz v2, :cond_e

    const-string v3, "__dbg_api_errors"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1
    :try_end_e
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_e} :catch_10
    .catch Ljava/lang/LinkageError; {:try_start_4 .. :try_end_e} :catch_10
    .catchall {:try_start_4 .. :try_end_e} :catchall_14

    :cond_e
    monitor-exit v0

    return v1

    :catch_10
    move-exception v2

    const/4 v1, 0x0

    monitor-exit v0

    return v1

    :catchall_14
    move-exception v2

    monitor-exit v0

    throw v2
.end method

.method private static emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V
    .registers 2
    .param p0, "event"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    .line 222
    :try_start_0
    invoke-static {p0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_3} :catch_6
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_3} :catch_4

    .line 224
    :goto_3
    goto :goto_8

    :catch_4
    move-exception v0

    goto :goto_3

    .line 223
    :catch_6
    move-exception v0

    goto :goto_3

    .line 225
    :goto_8
    return-void
.end method

.method private static emitTokenPhase(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V
    .registers 3
    .param p0, "event"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    .line 203
    :try_start_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    sget-object v1, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->TOKEN_PHASE:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-static {p0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_11} :catch_14
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_11} :catch_12

    goto :goto_15

    .line 205
    :catch_12
    move-exception v0

    goto :goto_15

    .line 204
    :catch_14
    move-exception v0

    .line 205
    :cond_15
    :goto_15
    nop

    .line 206
    return-void
.end method

.method public static declared-synchronized install(Landroid/content/SharedPreferences;)V
    .registers 5
    .param p0, "preferences"    # Landroid/content/SharedPreferences;

    const-class v0, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;

    monitor-enter v0

    .line 78
    const/4 v1, 0x0

    :try_start_4
    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->disable()V

    .line 79
    sget-object v2, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->source:Landroid/content/SharedPreferences;

    if-eqz v2, :cond_12

    sget-object v2, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->source:Landroid/content/SharedPreferences;

    sget-object v3, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->WATCH:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 80
    :cond_12
    sput-object p0, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->source:Landroid/content/SharedPreferences;

    .line 81
    sget-object v2, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->source:Landroid/content/SharedPreferences;

    if-eqz v2, :cond_1f

    sget-object v2, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->source:Landroid/content/SharedPreferences;

    sget-object v3, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->WATCH:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 82
    :cond_1f
    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->refresh()V
    :try_end_22
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_22} :catch_2c
    .catch Ljava/lang/LinkageError; {:try_start_4 .. :try_end_22} :catch_25
    .catchall {:try_start_4 .. :try_end_22} :catchall_23

    .line 84
    goto :goto_33

    .line 77
    .end local p0    # "preferences":Landroid/content/SharedPreferences;
    :catchall_23
    move-exception p0

    goto :goto_35

    .line 84
    .restart local p0    # "preferences":Landroid/content/SharedPreferences;
    :catch_25
    move-exception v2

    .local v2, "ignored":Ljava/lang/LinkageError;
    :try_start_26
    sput-object v1, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->source:Landroid/content/SharedPreferences;

    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->disable()V

    goto :goto_33

    .line 83
    .end local v2    # "ignored":Ljava/lang/LinkageError;
    :catch_2c
    move-exception v2

    .local v2, "ignored":Ljava/lang/RuntimeException;
    sput-object v1, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->source:Landroid/content/SharedPreferences;

    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->disable()V
    :try_end_32
    .catchall {:try_start_26 .. :try_end_32} :catchall_23

    .line 84
    .end local v2    # "ignored":Ljava/lang/RuntimeException;
    nop

    .line 85
    :goto_33
    monitor-exit v0

    return-void

    .line 77
    .end local p0    # "preferences":Landroid/content/SharedPreferences;
    :goto_35
    monitor-exit v0

    throw p0
.end method

.method public static installFromHost()V
    .registers 5

    .line 93
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "com.vk.core.preference.Preference"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 94
    .local v1, "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "a"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 95
    .local v2, "getter":Ljava/lang/reflect/Method;
    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 96
    .local v3, "prefs":Ljava/lang/Object;
    instance-of v4, v3, Landroid/content/SharedPreferences;

    if-eqz v4, :cond_1e

    move-object v4, v3

    check-cast v4, Landroid/content/SharedPreferences;

    goto :goto_1f

    :cond_1e
    move-object v4, v0

    :goto_1f
    invoke-static {v4}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->install(Landroid/content/SharedPreferences;)V
    :try_end_22
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_1 .. :try_end_22} :catch_2d
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_22} :catch_28
    .catch Ljava/lang/LinkageError; {:try_start_1 .. :try_end_22} :catch_23

    .end local v1    # "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "getter":Ljava/lang/reflect/Method;
    .end local v3    # "prefs":Ljava/lang/Object;
    goto :goto_31

    .line 99
    :catch_23
    move-exception v1

    .local v1, "ignored":Ljava/lang/LinkageError;
    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->install(Landroid/content/SharedPreferences;)V

    goto :goto_32

    .line 98
    .end local v1    # "ignored":Ljava/lang/LinkageError;
    :catch_28
    move-exception v1

    .local v1, "ignored":Ljava/lang/RuntimeException;
    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->install(Landroid/content/SharedPreferences;)V

    .end local v1    # "ignored":Ljava/lang/RuntimeException;
    goto :goto_31

    .line 97
    :catch_2d
    move-exception v1

    .local v1, "ignored":Ljava/lang/ReflectiveOperationException;
    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->install(Landroid/content/SharedPreferences;)V

    .line 99
    .end local v1    # "ignored":Ljava/lang/ReflectiveOperationException;
    :goto_31
    nop

    .line 100
    :goto_32
    return-void
.end method

.method public static markDialogsNetworkBegin()V
    .registers 1

    .line 229
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_NETWORK_BEGIN:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    return-void
.end method

.method public static markDialogsNetworkReturned()V
    .registers 1

    .line 230
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_NETWORK_RETURNED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    return-void
.end method

.method public static markDialogsSourceActual()V
    .registers 1

    .line 227
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_SOURCE_ACTUAL:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    return-void
.end method

.method public static markDialogsSourceCache()V
    .registers 1

    .line 226
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_SOURCE_CACHE:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    return-void
.end method

.method public static markDialogsSourceNetwork()V
    .registers 1

    .line 228
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_SOURCE_NETWORK:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    return-void
.end method

.method public static markDialogsStageBegin(Ljava/lang/String;)V
    .registers 2
    .param p0, "stage"    # Ljava/lang/String;

    .line 234
    const-string v0, "long_poll"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_LONGPOLL_BEGIN:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    goto :goto_29

    .line 235
    :cond_e
    const-string v0, "conversation_history"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_CONVERSATIONS_BEGIN:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    goto :goto_29

    .line 236
    :cond_1c
    const-string v0, "storage"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_STORAGE_BEGIN:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 237
    :cond_29
    :goto_29
    return-void
.end method

.method public static markDialogsStageException(Ljava/lang/String;)V
    .registers 2
    .param p0, "stage"    # Ljava/lang/String;

    .line 244
    const-string v0, "long_poll"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_LONGPOLL_EXCEPTION:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    goto :goto_29

    .line 245
    :cond_e
    const-string v0, "conversation_history"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_CONVERSATIONS_EXCEPTION:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    goto :goto_29

    .line 246
    :cond_1c
    const-string v0, "storage"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_STORAGE_EXCEPTION:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 247
    :cond_29
    :goto_29
    return-void
.end method

.method public static markDialogsStageReturned(Ljava/lang/String;)V
    .registers 2
    .param p0, "stage"    # Ljava/lang/String;

    .line 239
    const-string v0, "long_poll"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_LONGPOLL_RETURNED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    goto :goto_29

    .line 240
    :cond_e
    const-string v0, "conversation_history"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_CONVERSATIONS_RETURNED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    goto :goto_29

    .line 241
    :cond_1c
    const-string v0, "storage"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_STORAGE_RETURNED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 242
    :cond_29
    :goto_29
    return-void
.end method

.method public static markExceptionApi1()V
    .registers 1

    .line 133
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_EXCEPTION_API_CODE1:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 134
    return-void
.end method

.method public static markExceptionApi14()V
    .registers 1

    .line 137
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_EXCEPTION_API_CODE14:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 138
    return-void
.end method

.method public static markExceptionApiOther()V
    .registers 1

    .line 141
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_EXCEPTION_API_OTHER:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 142
    return-void
.end method

.method public static markExceptionIo()V
    .registers 1

    .line 145
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_EXCEPTION_IO:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 146
    return-void
.end method

.method public static markExceptionOther()V
    .registers 1

    .line 149
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_EXCEPTION_OTHER:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 150
    return-void
.end method

.method public static markHttpExecutorEnter()V
    .registers 1

    .line 208
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_HTTP_EXECUTOR_ENTER:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitTokenPhase(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 209
    return-void
.end method

.method public static markHttpExecutorReturned()V
    .registers 1

    .line 211
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_HTTP_EXECUTOR_RETURNED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitTokenPhase(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 212
    return-void
.end method

.method public static markMethodDispatchAttempt()V
    .registers 2

    .line 117
    :try_start_0
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->TOKEN_PHASE:Ljava/lang/ThreadLocal;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_7} :catch_8

    goto :goto_9

    .line 118
    :catch_8
    move-exception v0

    :goto_9
    nop

    .line 119
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_METHOD_DISPATCH_ATTEMPT:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 120
    return-void
.end method

.method public static markMethodException()V
    .registers 1

    .line 127
    :try_start_0
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->TOKEN_PHASE:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_5} :catch_6

    goto :goto_7

    .line 128
    :catch_6
    move-exception v0

    :goto_7
    nop

    .line 129
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_METHOD_EXCEPTION:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 130
    return-void
.end method

.method public static markMethodReturned()V
    .registers 1

    .line 122
    :try_start_0
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->TOKEN_PHASE:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_5} :catch_6

    goto :goto_7

    .line 123
    :catch_6
    move-exception v0

    :goto_7
    nop

    .line 124
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_METHOD_RETURNED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 125
    return-void
.end method

.method public static markOtherChecked()V
    .registers 1

    .line 170
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_OTHER_CHECKED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 171
    return-void
.end method

.method public static markOtherInterrupted()V
    .registers 1

    .line 158
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_OTHER_INTERRUPTED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 159
    return-void
.end method

.method public static markOtherJson()V
    .registers 1

    .line 162
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_OTHER_JSON:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 163
    return-void
.end method

.method public static markOtherRuntime()V
    .registers 1

    .line 166
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_OTHER_RUNTIME:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 167
    return-void
.end method

.method public static markOtherVkBase()V
    .registers 1

    .line 154
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_OTHER_VK_BASE:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 155
    return-void
.end method

.method public static markRejectedUserIdShape(Ljava/lang/Object;I)V
    .registers 5
    .param p0, "raw"    # Ljava/lang/Object;
    .param p1, "narrowed"    # I

    .line 275
    if-lez p1, :cond_8

    const v0, 0x77359400

    if-ge p1, v0, :cond_8

    return-void

    .line 276
    :cond_8
    :try_start_8
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->source:Landroid/content/SharedPreferences;

    if-eqz v0, :cond_41

    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->source:Landroid/content/SharedPreferences;

    const-string v1, "__dbg_api_errors"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_18

    goto :goto_41

    .line 277
    :cond_18
    invoke-static {p0, p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->classifyRejectedUserIdShape(Ljava/lang/Object;I)Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    move-result-object v0

    .line 278
    .local v0, "classification":Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;
    if-nez v0, :cond_1f

    return-void

    .line 279
    :cond_1f
    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 280
    instance-of v1, p0, Ljava/lang/Integer;

    if-nez v1, :cond_3b

    instance-of v1, p0, Ljava/lang/Long;

    if-eqz v1, :cond_2b

    goto :goto_3b

    .line 282
    :cond_2b
    instance-of v1, p0, Ljava/lang/String;

    if-eqz v1, :cond_35

    .line 283
    sget-object v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_ID_TYPE_TEXT:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    goto :goto_45

    .line 284
    :cond_35
    sget-object v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_ID_TYPE_OTHER:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    goto :goto_45

    .line 281
    :cond_3b
    :goto_3b
    sget-object v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->DIALOGS_ID_TYPE_INTEGRAL:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitDialogFixed(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V
    :try_end_40
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_40} :catch_44
    .catch Ljava/lang/LinkageError; {:try_start_8 .. :try_end_40} :catch_42

    goto :goto_45

    .line 276
    .end local v0    # "classification":Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;
    :cond_41
    :goto_41
    return-void

    .line 286
    :catch_42
    move-exception v0

    goto :goto_45

    .line 285
    :catch_44
    move-exception v0

    .line 286
    :goto_45
    nop

    .line 287
    return-void
.end method

.method public static markResponseParserEnter()V
    .registers 1

    .line 214
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_RESPONSE_PARSER_ENTER:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitTokenPhase(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 215
    return-void
.end method

.method public static markResponseParserReturned()V
    .registers 1

    .line 217
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_RESPONSE_PARSER_RETURNED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->emitTokenPhase(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 218
    return-void
.end method

.method public static markRuntimeClassCast()V
    .registers 1

    .line 178
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_RUNTIME_CLASS_CAST:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 179
    return-void
.end method

.method public static markRuntimeIllegalArgument()V
    .registers 1

    .line 186
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_RUNTIME_ILLEGAL_ARGUMENT:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 187
    return-void
.end method

.method public static markRuntimeIllegalState()V
    .registers 1

    .line 182
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_RUNTIME_ILLEGAL_STATE:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 183
    return-void
.end method

.method public static markRuntimeNullPointer()V
    .registers 1

    .line 174
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_RUNTIME_NULL_POINTER:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 175
    return-void
.end method

.method public static markRuntimeOther()V
    .registers 1

    .line 198
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_RUNTIME_OTHER:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 199
    return-void
.end method

.method public static markRuntimeSecurity()V
    .registers 1

    .line 194
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_RUNTIME_SECURITY:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 195
    return-void
.end method

.method public static markRuntimeUnsupported()V
    .registers 1

    .line 190
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_RUNTIME_UNSUPPORTED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 191
    return-void
.end method

.method public static markSameChainError()V
    .registers 1

    .line 110
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_SAME_CHAIN_ERROR:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 111
    return-void
.end method

.method public static markSameChainReturned()V
    .registers 1

    .line 107
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_SAME_CHAIN_RETURNED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 108
    return-void
.end method

.method public static markTokenConsumed()V
    .registers 1

    .line 104
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_TOKEN_CONSUMED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 105
    return-void
.end method

.method public static markTokenMapAttached()V
    .registers 1

    .line 114
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->HOST_TOKEN_MAP_ATTACHED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 115
    return-void
.end method

.method private static declared-synchronized refresh()V
    .registers 5

    const-class v0, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;

    monitor-enter v0

    .line 67
    const/4 v1, 0x0

    .line 68
    .local v1, "consent":Z
    :try_start_4
    sget-object v2, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->source:Landroid/content/SharedPreferences;

    const/4 v3, 0x0

    if-eqz v2, :cond_14

    sget-object v2, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->source:Landroid/content/SharedPreferences;

    const-string v4, "__dbg_api_errors"

    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_11} :catch_1a
    .catch Ljava/lang/LinkageError; {:try_start_4 .. :try_end_11} :catch_18
    .catchall {:try_start_4 .. :try_end_11} :catchall_16

    if-eqz v2, :cond_14

    const/4 v3, 0x1

    :cond_14
    move v1, v3

    .line 70
    :goto_15
    goto :goto_1c

    .line 66
    .end local v1    # "consent":Z
    :catchall_16
    move-exception v1

    goto :goto_29

    .line 70
    .restart local v1    # "consent":Z
    :catch_18
    move-exception v2

    goto :goto_15

    .line 69
    :catch_1a
    move-exception v2

    goto :goto_15

    .line 71
    :goto_1c
    if-eqz v1, :cond_24

    :try_start_1e
    sget-object v2, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->LOG_ONLY:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Sink;

    invoke-static {v2}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->installForPrivateQa(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Sink;)V

    goto :goto_27

    .line 72
    :cond_24
    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->disable()V
    :try_end_27
    .catchall {:try_start_1e .. :try_end_27} :catchall_16

    .line 73
    :goto_27
    monitor-exit v0

    return-void

    .line 66
    .end local v1    # "consent":Z
    :goto_29
    monitor-exit v0

    throw v1
.end method

.method static writeFixedEventToHostLog(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V
    .registers 6
    .param p0, "event"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    .line 47
    if-nez p0, :cond_3

    return-void

    .line 48
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "VTLiteCaptchaQA:E_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 50
    .local v0, "fixed":Ljava/lang/String;
    :try_start_1a
    const-string v1, "com.vk.log.L"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 51
    .local v1, "logger":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "b"

    const-class v3, [Ljava/lang/Object;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 52
    .local v2, "method":Ljava/lang/reflect/Method;
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_38
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_1a .. :try_end_38} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_1a .. :try_end_38} :catch_3c
    .catch Ljava/lang/LinkageError; {:try_start_1a .. :try_end_38} :catch_3a

    .line 55
    nop

    .end local v1    # "logger":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "method":Ljava/lang/reflect/Method;
    goto :goto_40

    :catch_3a
    move-exception v1

    goto :goto_3f

    .line 54
    :catch_3c
    move-exception v1

    goto :goto_3f

    .line 53
    :catch_3e
    move-exception v1

    .line 55
    :goto_3f
    nop

    .line 56
    :goto_40
    return-void
.end method
