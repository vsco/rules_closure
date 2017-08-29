# -*- mode: python; -*-
#
# Copyright 2016 The Closure Rules Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""External dependencies for Closure Rules."""

load("//closure/private:platform_http_file.bzl", "platform_http_file")

def closure_repositories(
    omit_aopalliance=False,
    omit_args4j=False,
    omit_asm=False,
    omit_asm_analysis=False,
    omit_asm_commons=False,
    omit_asm_util=False,
    omit_clang=False,
    omit_closure_compiler=False,
    omit_closure_library=False,
    omit_closure_stylesheets=False,
    omit_errorprone=False,
    omit_fonts_noto_hinted_deb=False,
    omit_fonts_noto_mono_deb=False,
    omit_gson=False,
    omit_guava=False,
    omit_guice=False,
    omit_guice_assistedinject=False,
    omit_guice_multibindings=False,
    omit_icu4j=False,
    omit_incremental_dom=False,
    omit_jsinterop_annotations=False,
    omit_json=False,
    omit_jsr250=False,
    omit_jsr305=False,
    omit_jsr330_inject=False,
    omit_libexpat_amd64_deb=False,
    omit_libfontconfig_amd64_deb=False,
    omit_libfreetype_amd64_deb=False,
    omit_libpng_amd64_deb=False,
    omit_phantomjs=False,
    omit_protobuf_java=False,
    omit_protobuf_js=False,
    omit_protoc_linux_x86_64=False,
    omit_protoc_macosx=False,
    omit_safe_html_types=False,
    omit_safe_html_types_html_proto=False,
    omit_soy=False,
    omit_soy_jssrc=False):
  closure_maven_server()
  if not omit_aopalliance:
    aopalliance()
  if not omit_args4j:
    args4j()
  if not omit_asm:
    asm()
  if not omit_asm_analysis:
    asm_analysis()
  if not omit_asm_commons:
    asm_commons()
  if not omit_asm_util:
    asm_util()
  if not omit_clang:
    clang()
  if not omit_closure_compiler:
    closure_compiler()
  if not omit_closure_library:
    closure_library()
  if not omit_closure_stylesheets:
    closure_stylesheets()
  if not omit_errorprone:
    errorprone()
  if not omit_fonts_noto_hinted_deb:
    fonts_noto_hinted_deb()
  if not omit_fonts_noto_mono_deb:
    fonts_noto_mono_deb()
  if not omit_gson:
    gson()
  if not omit_guava:
    guava()
  if not omit_guice:
    guice()
  if not omit_guice_assistedinject:
    guice_assistedinject()
  if not omit_guice_multibindings:
    guice_multibindings()
  if not omit_icu4j:
    icu4j()
  if not omit_incremental_dom:
    incremental_dom()
  if not omit_jsinterop_annotations:
    jsinterop_annotations()
  if not omit_json:
    json()
  if not omit_jsr250:
    jsr250()
  if not omit_jsr305:
    jsr305()
  if not omit_jsr330_inject:
    jsr330_inject()
  if not omit_libexpat_amd64_deb:
    libexpat_amd64_deb()
  if not omit_libfontconfig_amd64_deb:
    libfontconfig_amd64_deb()
  if not omit_libfreetype_amd64_deb:
    libfreetype_amd64_deb()
  if not omit_libpng_amd64_deb:
    libpng_amd64_deb()
  if not omit_phantomjs:
    phantomjs()
  if not omit_protobuf_java:
    protobuf_java()
  if not omit_protobuf_js:
    protobuf_js()
  if not omit_protoc_linux_x86_64:
    protoc_linux_x86_64()
  if not omit_protoc_macosx:
    protoc_macosx()
  if not omit_safe_html_types:
    safe_html_types()
  if not omit_safe_html_types_html_proto:
    safe_html_types_html_proto()
  if not omit_soy:
    soy()
  if not omit_soy_jssrc:
    soy_jssrc()

# MAINTAINERS
#
# 1. Please sort everything in this file.
#
# 2. Every external rule must have a SHA checksum.
#
# 3. Use http:// URLs since we're relying on the checksum for security.
#
# 4. Files must be mirrored to servers operated by Google SREs. This minimizes
#    the points of failure. It also minimizes the probability failure. For
#    example, if we assumed all external download servers were equal, had 99.9%
#    availability, and uniformly distributed downtime, that would put the
#    probability of an install working at 97.0% (0.999^30). Google static
#    content servers should have 99.999% availability, which *in theory* means
#    Closure Rules will install without any requests failing 99.9% of the time.
#
#    To get files mirrored, email the new artifacts or URLs to jart@google.com
#    so she can run:
#
#      bzmirror() {
#        local url="${1:?url}"
#        if [[ "${url}" =~ ^([^:]+):([^:]+):([^:]+)$ ]]; then
#          url="http://repo1.maven.org/maven2/${BASH_REMATCH[1]//.//}/${BASH_REMATCH[2]}/${BASH_REMATCH[3]}/${BASH_REMATCH[2]}-${BASH_REMATCH[3]}.jar"
#        fi
#        local dest="gs://bazel-mirror/${url#http*//}"
#        local desturl="http://bazel-mirror.storage.googleapis.com/${url#http*//}"
#        local name="$(basename "${dest}")"
#        wget -O "/tmp/${name}" "${url}" || return 1
#        gsutil cp -a public-read "/tmp/${name}" "${dest}" || return 1
#        gsutil setmeta -h 'Cache-Control:public, max-age=31536000' "${dest}" || return 1
#        rm "/tmp/${name}" || return 1
#        curl -I "${desturl}"
#        echo
#        echo "${desturl}"
#      }

def aopalliance():
  native.maven_jar(
      name = "aopalliance",
      artifact = "aopalliance:aopalliance:1.0",
      sha1 = "0235ba8b489512805ac13a8f9ea77a1ca5ebe3e8",
      server = "closure_maven_server",
  )

def args4j():
  native.maven_jar(
      name = "args4j",
      artifact = "args4j:args4j:2.0.26",
      sha1 = "01ebb18ebb3b379a74207d5af4ea7c8338ebd78b",
      server = "closure_maven_server",
  )

def asm():
  native.maven_jar(
      name = "asm",
      artifact = "org.ow2.asm:asm:5.0.3",
      sha1 = "dcc2193db20e19e1feca8b1240dbbc4e190824fa",
      server = "closure_maven_server",
  )

def asm_analysis():
  native.maven_jar(
      name = "asm_analysis",
      artifact = "org.ow2.asm:asm-analysis:5.0.3",
      sha1 = "c7126aded0e8e13fed5f913559a0dd7b770a10f3",
      server = "closure_maven_server",
  )

def asm_commons():
  native.maven_jar(
      name = "asm_commons",
      artifact = "org.ow2.asm:asm-commons:5.0.3",
      sha1 = "a7111830132c7f87d08fe48cb0ca07630f8cb91c",
      server = "closure_maven_server",
  )

def asm_util():
  native.maven_jar(
      name = "asm_util",
      artifact = "org.ow2.asm:asm-util:5.0.3",
      sha1 = "1512e5571325854b05fb1efce1db75fcced54389",
      server = "closure_maven_server",
  )

def clang():
  platform_http_file(
      name = "clang",
      amd64_url = "http://bazel-mirror.storage.googleapis.com/llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-linux-gnu-ubuntu-14.04.tar.xz",
      amd64_sha256 = "3120c3055ea78bbbb6848510a2af70c68538b990cb0545bac8dad01df8ff69d7",
      macos_url = "http://bazel-mirror.storage.googleapis.com/llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-apple-darwin.tar.xz",
      macos_sha256 = "e5a961e04b0e1738bbb5b824886a34932dc13b0af699d1fe16519d814d7b776f",
  )

def closure_compiler():
  native.maven_jar(
      name = "closure_compiler",
      artifact = "com.google.javascript:closure-compiler-unshaded:v20170806",
      sha1 = "1502e3813149a51d470e48e4c1a5c177968e08d0",
      server = "closure_maven_server",
  )

def closure_library():
  # To update Closure Library, one needs to uncomment and run the
  # js_library_files_maker and js_testing_files_maker genrules in
  # closure_library.BUILD.
  native.new_http_archive(
      name = "closure_library",
      url = "http://bazel-mirror.storage.googleapis.com/github.com/google/closure-library/archive/v20170806.tar.gz",
      sha256 = "03571b5f69c3fb1ba92633b089baaffdaa994c2f7ec4f94b05725632d70d3896",
      strip_prefix = "closure-library-20170806",
      build_file = str(Label("//closure/library:closure_library.BUILD")),
  )

def closure_maven_server():
  native.maven_server(
      name = "closure_maven_server",
      url = "http://bazel-mirror.storage.googleapis.com/repo1.maven.org/maven2/",
  )

def closure_stylesheets():
  native.maven_jar(
      name = "closure_stylesheets",
      artifact = "com.google.closure-stylesheets:closure-stylesheets:1.5.0",
      sha1 = "0d2b1c0dcba2ac4e13f28721f89134f7333fed2c",
      server = "closure_maven_server",
  )

def errorprone():
  native.maven_jar(
      name = "errorprone",
      artifact = "com.google.errorprone:error_prone_annotations:2.0.19",
      sha1 = "c3754a0bdd545b00ddc26884f9e7624f8b6a14de",
      server = "closure_maven_server",
  )

def fonts_noto_hinted_deb():
  native.http_file(
      name = "fonts_noto_hinted_deb",
      url = "http://bazel-mirror.storage.googleapis.com/http.us.debian.org/debian/pool/main/f/fonts-noto/fonts-noto-hinted_20160116-1_all.deb",
      sha256 = "25b362c9437a7859ce034f22d94b698e8ed25007b443e5a26228ed5b3d2d32d4",
  )

def fonts_noto_mono_deb():
  native.http_file(
      name = "fonts_noto_mono_deb",
      url = "http://bazel-mirror.storage.googleapis.com/http.us.debian.org/debian/pool/main/f/fonts-noto/fonts-noto-mono_20160116-1_all.deb",
      sha256 = "74b457715f275ed893998a70d6bc955f67da6d36b36b422dbeeb045160edacb6",
  )

def gson():
  native.maven_jar(
      name = "gson",
      artifact = "com.google.code.gson:gson:2.7",
      sha1 = "751f548c85fa49f330cecbb1875893f971b33c4e",
      server = "closure_maven_server",
  )

def guava():
  native.maven_jar(
      name = "guava",
      artifact = "com.google.guava:guava:20.0",
      sha1 = "89507701249388e1ed5ddcf8c41f4ce1be7831ef",
      server = "closure_maven_server",
  )

def guice():
  native.maven_jar(
      name = "guice",
      artifact = "com.google.inject:guice:4.1.0",
      sha1 = "eeb69005da379a10071aa4948c48d89250febb07",
      server = "closure_maven_server",
  )

def guice_assistedinject():
  native.maven_jar(
      name = "guice_assistedinject",
      artifact = "com.google.inject.extensions:guice-assistedinject:4.1.0",
      sha1 = "af799dd7e23e6fe8c988da12314582072b07edcb",
      server = "closure_maven_server",
  )

def guice_multibindings():
  native.maven_jar(
      name = "guice_multibindings",
      artifact = "com.google.inject.extensions:guice-multibindings:4.1.0",
      sha1 = "3b27257997ac51b0f8d19676f1ea170427e86d51",
      server = "closure_maven_server",
  )

def icu4j():
  native.maven_jar(
      name = "icu4j",
      artifact = "com.ibm.icu:icu4j:57.1",
      sha1 = "198ea005f41219f038f4291f0b0e9f3259730e92",
      server = "closure_maven_server",
  )

def incremental_dom():
  # To update Incremental DOM, one needs to update
  # third_party/incremental_dom/build.sh to remain compatible with the
  # upstream "js-closure" gulpfile.js target.
  # https://github.com/google/incremental-dom/blob/master/gulpfile.js
  native.http_file(
      name = "incremental_dom",
      url = "http://bazel-mirror.storage.googleapis.com/github.com/google/incremental-dom/archive/0.5.2.tar.gz",
      sha256 = "554a778dff5cba561a98619b2f3de5061848744644c870f718e2cdcf9bf0dccf",
  )

def jsinterop_annotations():
  native.maven_jar(
      name = "jsinterop_annotations",
      artifact = "com.google.jsinterop:jsinterop-annotations:1.0.1",
      sha1 = "e9135c43d12b30a6d02706e97ce256a90d68dc9d",
      server = "closure_maven_server",
  )

def json():
  native.maven_jar(
      name = "json",
      artifact = "org.json:json:20160212",
      sha1 = "a742e3f85161835b95877478c5dd5b405cefaab9",
      server = "closure_maven_server",
  )

def jsr250():
  native.maven_jar(
      name = "jsr250",
      artifact = "javax.annotation:jsr250-api:1.0",
      sha1 = "5025422767732a1ab45d93abfea846513d742dcf",
      server = "closure_maven_server",
  )

def jsr305():
  native.maven_jar(
      name = "jsr305",
      artifact = "com.google.code.findbugs:jsr305:2.0.3",
      sha1 = "5871fb60dc68d67da54a663c3fd636a10a532948",
      server = "closure_maven_server",
  )

def jsr330_inject():
  native.maven_jar(
      name = "jsr330_inject",
      artifact = "javax.inject:javax.inject:1",
      sha1 = "6975da39a7040257bd51d21a231b76c915872d38",
      server = "closure_maven_server",
  )

def libexpat_amd64_deb():
  native.http_file(
      name = "libexpat_amd64_deb",
      url = "http://bazel-mirror.storage.googleapis.com/http.us.debian.org/debian/pool/main/e/expat/libexpat1_2.1.0-6+deb8u1_amd64.deb",
      sha256 = "1b006e659f383e09909595d8b84b79828debd7323d00e8a28b72ccd902273861",
  )

def libfontconfig_amd64_deb():
  native.http_file(
      name = "libfontconfig_amd64_deb",
      url = "http://bazel-mirror.storage.googleapis.com/http.us.debian.org/debian/pool/main/f/fontconfig/libfontconfig1_2.11.0-6.3_amd64.deb",
      sha256 = "2b21f91c8b46caba41221f1e45c5a37cac08ce1298dd7a28442f1b7332fa211b",
  )

def libfreetype_amd64_deb():
  native.http_file(
      name = "libfreetype_amd64_deb",
      url = "http://bazel-mirror.storage.googleapis.com/http.us.debian.org/debian/pool/main/f/freetype/libfreetype6_2.5.2-3+deb8u1_amd64.deb",
      sha256 = "80184d932f9b0acc130af081c60a2da114c7b1e7531c18c63174498fae47d862",
  )

def libpng_amd64_deb():
  native.http_file(
      name = "libpng_amd64_deb",
      url = "http://bazel-mirror.storage.googleapis.com/http.us.debian.org/debian/pool/main/libp/libpng/libpng12-0_1.2.50-2+deb8u2_amd64.deb",
      sha256 = "a57b6d53169c67a7754719f4b742c96554a18f931ca5b9e0408fb6502bb77e80",
  )

def phantomjs():
  platform_http_file(
      name = "phantomjs",
      amd64_url = "http://bazel-mirror.storage.googleapis.com/bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2",
      amd64_sha256 = "86dd9a4bf4aee45f1a84c9f61cf1947c1d6dce9b9e8d2a907105da7852460d2f",
      macos_url = "http://bazel-mirror.storage.googleapis.com/bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-macosx.zip",
      macos_sha256 = "538cf488219ab27e309eafc629e2bcee9976990fe90b1ec334f541779150f8c1",
)

def protobuf_java():
  native.maven_jar(
      name = "protobuf_java",
      artifact = "com.google.protobuf:protobuf-java:3.3.0",
      sha1 = "9f301d1a27501b1afcb2ed16aad428337dabf9e4",
      server = "closure_maven_server",
  )

def protobuf_js():
  # 3.3.0 has a Closure Compiler bug because it references Node's Buffer
  # type. This was fixed in f00e06c95bc117fb2ed0ca56c96041c93039f1fe.
  #
  # TODO(jart): Update when https://github.com/google/protobuf/pull/3387
  #             is merged.
  native.new_http_archive(
      name = "protobuf_js",
      url = "http://mirror.bazel.build/github.com/google/protobuf/archive/33545583286a31940b6a732b1888e639cdf2e3c4.tar.gz",
      sha256 = "ecd9f92f137e75d140a8b611cd2c0d6c0f34f561946dc5f7fcecde631bb13c25",
      strip_prefix = "protobuf-33545583286a31940b6a732b1888e639cdf2e3c4",
      build_file = str(Label("//closure/protobuf:protobuf_js.BUILD")),
  )

def protoc_linux_x86_64():
  native.http_file(
      name = "protoc_linux_x86_64",
      url = "http://bazel-mirror.storage.googleapis.com/github.com/google/protobuf/releases/download/v3.3.0/protoc-3.3.0-linux-x86_64.zip",
      sha256 = "feb112bbc11ea4e2f7ef89a359b5e1c04428ba6cfa5ee628c410eccbfe0b64c3",
  )

def protoc_macosx():
  native.http_file(
      name = "protoc_macosx",
      url = "http://bazel-mirror.storage.googleapis.com/github.com/google/protobuf/releases/download/v3.3.0/protoc-3.3.0-osx-x86_64.zip",
      sha256 = "d752ba0ea67239e327a48b2f23da0e673928a9ff06ee530319fc62200c0aff89",
  )

def safe_html_types():
  native.maven_jar(
      name = "safe_html_types",
      artifact = "com.google.common.html.types:types:1.0.7",
      sha1 = "7d4afac9f631a2c1adecc21350a4e88241185eb4",
      server = "closure_maven_server",
  )

def safe_html_types_html_proto():
  native.http_file(
      name = "safe_html_types_html_proto",
      sha256 = "9196aa9e0dc231969ea969e1e752707cb391b5a3687c6c72089dd0edaad2d5f9",
      url = "http://mirror.bazel.build/raw.githubusercontent.com/google/safe-html-types/release-1.0.7/proto/src/main/protobuf/webutil/html/types/html.proto",
  )

def soy():
  native.maven_jar(
      name = "soy",
      artifact = "com.google.template:soy:2017-08-08",
      sha1 = "792aa49e3ec3f61e793e56b499f0724df1c1e16c",
      server = "closure_maven_server",
  )

def soy_jssrc():
  native.new_http_archive(
      name = "soy_jssrc",
      sha256 = "a902d3aef1db603890945fe645217209b81e527ef26a9b89b7647172629c6810",
      url = "http://mirror.bazel.build/repo1.maven.org/maven2/com/google/template/soy/2017-08-08/soy-2017-08-08-jssrc_js.jar",
      build_file = str(Label("//closure/templates:soy_jssrc.BUILD")),
      type = "zip",
  )
