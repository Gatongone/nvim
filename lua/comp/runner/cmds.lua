return
{
    c          = { cmd = "gcc '$filename' -o '$runfile' ./'$runfile' ; $delete '$runfile'" },
    cpp        = { cmd = "g++ '$filename' -O2 -g -Wall -o '$runfile' ; ./'$runfile' ; $delete '$runfile'" },
    cs         = { cmd = "dotnet script '$filename'" },
    go         = { cmd = "go run '$filename'" },
    java       = { cmd = "javac '$filename' ; java '$runfile' ; $delete '$runfile.class'" },
    javascript = { cmd = "node --trace-warnings '$filename'" },
    php        = { cmd = "php '$filename'" },
    python     = { cmd = "python3 '$filename'" },
    ruby       = { cmd = "ruby $filename" },
    rust       = { cmd = "rustc '$filename' ; ./'$runfile' ; $delete '$runfile'" },
    sh         = { cmd = "bash '$filename'" },
    typescript = { cmd = "node --trace-warnings '$filename'" },
    lua        = { cmd = "luajit '$filename'" },
    markdown   = { cmd = "glow '$filename'" },
    zig        = { cmd = "zig run '$filename'" }
}
