pub fn as_byte(s: str<1>) -> u8 {
    s.as_bytes()[0]
}

pub fn as_bytes<N>(s: str<N>) -> [u8; N] {
    let mut result: [u8; N] = [0; N];

    for i in 0..N {
        let cr = s.as_bytes()[i] as u8;
        result[i] = 
        if cr == 0 { 0 as u8 }
        else if cr == 1 { 1 as u8 }
        else if cr == 2 { 2 as u8 }
        else if cr == 3 { 3 as u8 }
        else if cr == 4 { 4 as u8 }
        else if cr == 5 { 5 as u8 }
        else if cr == 6 { 6 as u8 }
        else if cr == 7 { 7 as u8 }
        else if cr == 8 { 8 as u8 }
        else if cr == 9 { 9 as u8 }
        else if cr == 10 { 10 as u8 }
        else if cr == 11 { 11 as u8 }
        else if cr == 12 { 12 as u8 }
        else if cr == 13 { 13 as u8 }
        else if cr == 14 { 14 as u8 }
        else if cr == 15 { 15 as u8 }
        else if cr == 16 { 16 as u8 }
        else if cr == 17 { 17 as u8 }
        else if cr == 18 { 18 as u8 }
        else if cr == 19 { 19 as u8 }
        else if cr == 20 { 20 as u8 }
        else if cr == 21 { 21 as u8 }
        else if cr == 22 { 22 as u8 }
        else if cr == 23 { 23 as u8 }
        else if cr == 24 { 24 as u8 }
        else if cr == 25 { 25 as u8 }
        else if cr == 26 { 26 as u8 }
        else if cr == 27 { 27 as u8 }
        else if cr == 28 { 28 as u8 }
        else if cr == 29 { 29 as u8 }
        else if cr == 30 { 30 as u8 }
        else if cr == 31 { 31 as u8 }
        else if cr == 32 { 32 as u8 }
        else if cr == 33 { 33 as u8 }
        else if cr == 34 { 34 as u8 }
        else if cr == 35 { 35 as u8 }
        else if cr == 36 { 36 as u8 }
        else if cr == 37 { 37 as u8 }
        else if cr == 38 { 38 as u8 }
        else if cr == 39 { 39 as u8 }
        else if cr == 40 { 40 as u8 }
        else if cr == 41 { 41 as u8 }
        else if cr == 42 { 42 as u8 }
        else if cr == 43 { 43 as u8 }
        else if cr == 44 { 44 as u8 }
        else if cr == 45 { 45 as u8 }
        else if cr == 46 { 46 as u8 }
        else if cr == 47 { 47 as u8 }
        else if cr == 48 { 48 as u8 }
        else if cr == 49 { 49 as u8 }
        else if cr == 50 { 50 as u8 }
        else if cr == 51 { 51 as u8 }
        else if cr == 52 { 52 as u8 }
        else if cr == 53 { 53 as u8 }
        else if cr == 54 { 54 as u8 }
        else if cr == 55 { 55 as u8 }
        else if cr == 56 { 56 as u8 }
        else if cr == 57 { 57 as u8 }
        else if cr == 58 { 58 as u8 }
        else if cr == 59 { 59 as u8 }
        else if cr == 60 { 60 as u8 }
        else if cr == 61 { 61 as u8 }
        else if cr == 62 { 62 as u8 }
        else if cr == 63 { 63 as u8 }
        else if cr == 64 { 64 as u8 }
        else if cr == 65 { 65 as u8 }
        else if cr == 66 { 66 as u8 }
        else if cr == 67 { 67 as u8 }
        else if cr == 68 { 68 as u8 }
        else if cr == 69 { 69 as u8 }
        else if cr == 70 { 70 as u8 }
        else if cr == 71 { 71 as u8 }
        else if cr == 72 { 72 as u8 }
        else if cr == 73 { 73 as u8 }
        else if cr == 74 { 74 as u8 }
        else if cr == 75 { 75 as u8 }
        else if cr == 76 { 76 as u8 }
        else if cr == 77 { 77 as u8 }
        else if cr == 78 { 78 as u8 }
        else if cr == 79 { 79 as u8 }
        else if cr == 80 { 80 as u8 }
        else if cr == 81 { 81 as u8 }
        else if cr == 82 { 82 as u8 }
        else if cr == 83 { 83 as u8 }
        else if cr == 84 { 84 as u8 }
        else if cr == 85 { 85 as u8 }
        else if cr == 86 { 86 as u8 }
        else if cr == 87 { 87 as u8 }
        else if cr == 88 { 88 as u8 }
        else if cr == 89 { 89 as u8 }
        else if cr == 90 { 90 as u8 }
        else if cr == 91 { 91 as u8 }
        else if cr == 92 { 92 as u8 }
        else if cr == 93 { 93 as u8 }
        else if cr == 94 { 94 as u8 }
        else if cr == 95 { 95 as u8 }
        else if cr == 96 { 96 as u8 }
        else if cr == 97 { 97 as u8 }
        else if cr == 98 { 98 as u8 }
        else if cr == 99 { 99 as u8 }
        else if cr == 100 { 100 as u8 }
        else if cr == 101 { 101 as u8 }
        else if cr == 102 { 102 as u8 }
        else if cr == 103 { 103 as u8 }
        else if cr == 104 { 104 as u8 }
        else if cr == 105 { 105 as u8 }
        else if cr == 106 { 106 as u8 }
        else if cr == 107 { 107 as u8 }
        else if cr == 108 { 108 as u8 }
        else if cr == 109 { 109 as u8 }
        else if cr == 110 { 110 as u8 }
        else if cr == 111 { 111 as u8 }
        else if cr == 112 { 112 as u8 }
        else if cr == 113 { 113 as u8 }
        else if cr == 114 { 114 as u8 }
        else if cr == 115 { 115 as u8 }
        else if cr == 116 { 116 as u8 }
        else if cr == 117 { 117 as u8 }
        else if cr == 118 { 118 as u8 }
        else if cr == 119 { 119 as u8 }
        else if cr == 120 { 120 as u8 }
        else if cr == 121 { 121 as u8 }
        else if cr == 122 { 122 as u8 }
        else if cr == 123 { 123 as u8 }
        else if cr == 124 { 124 as u8 }
        else if cr == 125 { 125 as u8 }
        else if cr == 126 { 126 as u8 }
        else if cr == 127 { 127 as u8 }
        else if cr == 128 { 128 as u8 }
        else if cr == 129 { 129 as u8 }
        else if cr == 130 { 130 as u8 }
        else if cr == 131 { 131 as u8 }
        else if cr == 132 { 132 as u8 }
        else if cr == 133 { 133 as u8 }
        else if cr == 134 { 134 as u8 }
        else if cr == 135 { 135 as u8 }
        else if cr == 136 { 136 as u8 }
        else if cr == 137 { 137 as u8 }
        else if cr == 138 { 138 as u8 }
        else if cr == 139 { 139 as u8 }
        else if cr == 140 { 140 as u8 }
        else if cr == 141 { 141 as u8 }
        else if cr == 142 { 142 as u8 }
        else if cr == 143 { 143 as u8 }
        else if cr == 144 { 144 as u8 }
        else if cr == 145 { 145 as u8 }
        else if cr == 146 { 146 as u8 }
        else if cr == 147 { 147 as u8 }
        else if cr == 148 { 148 as u8 }
        else if cr == 149 { 149 as u8 }
        else if cr == 150 { 150 as u8 }
        else if cr == 151 { 151 as u8 }
        else if cr == 152 { 152 as u8 }
        else if cr == 153 { 153 as u8 }
        else if cr == 154 { 154 as u8 }
        else if cr == 155 { 155 as u8 }
        else if cr == 156 { 156 as u8 }
        else if cr == 157 { 157 as u8 }
        else if cr == 158 { 158 as u8 }
        else if cr == 159 { 159 as u8 }
        else if cr == 160 { 160 as u8 }
        else if cr == 161 { 161 as u8 }
        else if cr == 162 { 162 as u8 }
        else if cr == 163 { 163 as u8 }
        else if cr == 164 { 164 as u8 }
        else if cr == 165 { 165 as u8 }
        else if cr == 166 { 166 as u8 }
        else if cr == 167 { 167 as u8 }
        else if cr == 168 { 168 as u8 }
        else if cr == 169 { 169 as u8 }
        else if cr == 170 { 170 as u8 }
        else if cr == 171 { 171 as u8 }
        else if cr == 172 { 172 as u8 }
        else if cr == 173 { 173 as u8 }
        else if cr == 174 { 174 as u8 }
        else if cr == 175 { 175 as u8 }
        else if cr == 176 { 176 as u8 }
        else if cr == 177 { 177 as u8 }
        else if cr == 178 { 178 as u8 }
        else if cr == 179 { 179 as u8 }
        else if cr == 180 { 180 as u8 }
        else if cr == 181 { 181 as u8 }
        else if cr == 182 { 182 as u8 }
        else if cr == 183 { 183 as u8 }
        else if cr == 184 { 184 as u8 }
        else if cr == 185 { 185 as u8 }
        else if cr == 186 { 186 as u8 }
        else if cr == 187 { 187 as u8 }
        else if cr == 188 { 188 as u8 }
        else if cr == 189 { 189 as u8 }
        else if cr == 190 { 190 as u8 }
        else if cr == 191 { 191 as u8 }
        else if cr == 192 { 192 as u8 }
        else if cr == 193 { 193 as u8 }
        else if cr == 194 { 194 as u8 }
        else if cr == 195 { 195 as u8 }
        else if cr == 196 { 196 as u8 }
        else if cr == 197 { 197 as u8 }
        else if cr == 198 { 198 as u8 }
        else if cr == 199 { 199 as u8 }
        else if cr == 200 { 200 as u8 }
        else if cr == 201 { 201 as u8 }
        else if cr == 202 { 202 as u8 }
        else if cr == 203 { 203 as u8 }
        else if cr == 204 { 204 as u8 }
        else if cr == 205 { 205 as u8 }
        else if cr == 206 { 206 as u8 }
        else if cr == 207 { 207 as u8 }
        else if cr == 208 { 208 as u8 }
        else if cr == 209 { 209 as u8 }
        else if cr == 210 { 210 as u8 }
        else if cr == 211 { 211 as u8 }
        else if cr == 212 { 212 as u8 }
        else if cr == 213 { 213 as u8 }
        else if cr == 214 { 214 as u8 }
        else if cr == 215 { 215 as u8 }
        else if cr == 216 { 216 as u8 }
        else if cr == 217 { 217 as u8 }
        else if cr == 218 { 218 as u8 }
        else if cr == 219 { 219 as u8 }
        else if cr == 220 { 220 as u8 }
        else if cr == 221 { 221 as u8 }
        else if cr == 222 { 222 as u8 }
        else if cr == 223 { 223 as u8 }
        else if cr == 224 { 224 as u8 }
        else if cr == 225 { 225 as u8 }
        else if cr == 226 { 226 as u8 }
        else if cr == 227 { 227 as u8 }
        else if cr == 228 { 228 as u8 }
        else if cr == 229 { 229 as u8 }
        else if cr == 230 { 230 as u8 }
        else if cr == 231 { 231 as u8 }
        else if cr == 232 { 232 as u8 }
        else if cr == 233 { 233 as u8 }
        else if cr == 234 { 234 as u8 }
        else if cr == 235 { 235 as u8 }
        else if cr == 236 { 236 as u8 }
        else if cr == 237 { 237 as u8 }
        else if cr == 238 { 238 as u8 }
        else if cr == 239 { 239 as u8 }
        else if cr == 240 { 240 as u8 }
        else if cr == 241 { 241 as u8 }
        else if cr == 242 { 242 as u8 }
        else if cr == 243 { 243 as u8 }
        else if cr == 244 { 244 as u8 }
        else if cr == 245 { 245 as u8 }
        else if cr == 246 { 246 as u8 }
        else if cr == 247 { 247 as u8 }
        else if cr == 248 { 248 as u8 }
        else if cr == 249 { 249 as u8 }
        else if cr == 250 { 250 as u8 }
        else if cr == 251 { 251 as u8 }
        else if cr == 252 { 252 as u8 }
        else if cr == 253 { 253 as u8 }
        else if cr == 254 { 254 as u8 }
        else if cr == 255 { 255 as u8 }
        else { assert(false, "u8 overflow"); 0 };
    }
    result
}

#[test]
fn test_as_byte() {
    assert_eq(97, as_byte("a"));
    assert_eq(65, as_byte("A"));
    assert_eq(35, as_byte("#"));
}

#[test]
fn test_as_bytes() {
    assert_eq([102], as_bytes("f"));
    assert_eq([65, 66, 67], as_bytes("ABC"));
    assert_eq([35, 36, 37], as_bytes("#$%"));
}
