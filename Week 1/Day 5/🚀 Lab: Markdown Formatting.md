```md
func formatMarkdown(_ text: String, format: MarkdownFormat) -> String
{
     switch format {
    case .h1:
        return "# \(text)"
    case .strong:
        return "**\(text)**"
    case .em:
        return "<em>\(text)</em>"
    case .unordered_list:
        return "* \(text)"
    case .code:
        return "`\(text)`"
    case .Strikethrough:
        return "~~\(text).~~"
    case .email:
        return "<\(text)@tuwaiq.edu.sa>"
    case .Link:
        return "[title](https://tuwaiq.edu.sa/)"
    case .image:
        return "![alt text](\(text).jpg)"
    case .blockquote:
        return "> \(text)"
    }
}
enum MarkdownFormat{
    case h1
    case strong
    case em
    case unordered_list
    case code
    case Strikethrough
    case email
    case Link
    case image
    case blockquote 
}

print(formatMarkdown("Hello", format: .h1))
print(formatMarkdown("Hello", format: .strong))
print(formatMarkdown("Hello", format: .em))
print(formatMarkdown("Hello", format: .unordered_list))
print(formatMarkdown("Hello", format: .code))
print(formatMarkdown("Hello", format: .Strikethrough))
print(formatMarkdown("Hello", format: .email))
print(formatMarkdown("Hello", format: .Link))
print(formatMarkdown("Hello", format: .image))
print(formatMarkdown("Hello", format: .blockquote))
```
