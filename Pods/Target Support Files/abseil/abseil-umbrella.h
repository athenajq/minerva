#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "algorithm/algorithm.h"
#import "base/internal/atomic_hook.h"
#import "base/call_once.h"
#import "base/casts.h"
#import "base/internal/cycleclock.h"
#import "base/internal/low_level_scheduling.h"
#import "base/internal/per_thread_tls.h"
#import "base/internal/spinlock.h"
#import "base/internal/sysinfo.h"
#import "base/internal/thread_identity.h"
#import "base/internal/tsan_mutex_interface.h"
#import "base/internal/unscaledcycleclock.h"
#import "base/internal/hide_ptr.h"
#import "base/internal/identity.h"
#import "base/internal/inline_variable.h"
#import "base/internal/invoke.h"
#import "base/internal/scheduling_mode.h"
#import "base/internal/bits.h"
#import "base/config.h"
#import "base/options.h"
#import "base/policy_checks.h"
#import "base/attributes.h"
#import "base/const_init.h"
#import "base/internal/thread_annotations.h"
#import "base/macros.h"
#import "base/optimization.h"
#import "base/port.h"
#import "base/thread_annotations.h"
#import "base/dynamic_annotations.h"
#import "base/internal/endian.h"
#import "base/internal/unaligned_access.h"
#import "base/internal/errno_saver.h"
#import "base/log_severity.h"
#import "base/internal/raw_logging.h"
#import "base/internal/spinlock_akaros.inc"
#import "base/internal/spinlock_linux.inc"
#import "base/internal/spinlock_posix.inc"
#import "base/internal/spinlock_wait.h"
#import "base/internal/spinlock_win32.inc"
#import "base/internal/throw_delegate.h"
#import "container/internal/compressed_tuple.h"
#import "container/inlined_vector.h"
#import "container/internal/inlined_vector.h"
#import "memory/memory.h"
#import "meta/type_traits.h"
#import "numeric/int128.h"
#import "numeric/int128_have_intrinsic.inc"
#import "numeric/int128_no_intrinsic.inc"
#import "strings/internal/char_map.h"
#import "strings/internal/escaping.h"
#import "strings/internal/ostringstream.h"
#import "strings/internal/resize_uninitialized.h"
#import "strings/internal/utf8.h"
#import "strings/str_format.h"
#import "strings/internal/str_format/arg.h"
#import "strings/internal/str_format/bind.h"
#import "strings/internal/str_format/checker.h"
#import "strings/internal/str_format/extension.h"
#import "strings/internal/str_format/float_conversion.h"
#import "strings/internal/str_format/output.h"
#import "strings/internal/str_format/parser.h"
#import "strings/ascii.h"
#import "strings/charconv.h"
#import "strings/escaping.h"
#import "strings/internal/charconv_bigint.h"
#import "strings/internal/charconv_parse.h"
#import "strings/internal/memutil.h"
#import "strings/internal/stl_type_traits.h"
#import "strings/internal/str_join_internal.h"
#import "strings/internal/str_split_internal.h"
#import "strings/match.h"
#import "strings/numbers.h"
#import "strings/str_cat.h"
#import "strings/str_join.h"
#import "strings/str_replace.h"
#import "strings/str_split.h"
#import "strings/string_view.h"
#import "strings/strip.h"
#import "strings/substitute.h"
#import "types/bad_optional_access.h"
#import "types/internal/optional.h"
#import "types/optional.h"
#import "types/internal/span.h"
#import "types/span.h"
#import "utility/utility.h"

FOUNDATION_EXPORT double abslVersionNumber;
FOUNDATION_EXPORT const unsigned char abslVersionString[];
